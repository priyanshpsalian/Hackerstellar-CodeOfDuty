const functions = require('firebase-functions');

//// SDK Config ////

const { Configuration, OpenAIApi } = require('openai');
const configuration = new Configuration({
  organization: "org-FePBbKs7Fw8eiYd79riEu7Fz", // REPLACE with your API credentials
  apiKey: "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", // REPLACE with your API credentials
});
const openai = new OpenAIApi(configuration);

const Alpaca = require('@alpacahq/alpaca-trade-api');
const alpaca = new Alpaca({
  keyId: "26669da693b8c5dc3a5be2476ad313f0", // REPLACE with your API credentials
  secretKey: "8ac1f3af800e9c7c965d286ec1a81685d78b9813", // REPLACE with your API credentials
  // paper: true,
});

//// PUPPETEER Scrape Data from Twitter for better AI context ////

const puppeteer = require('puppeteer');

async function scrape() {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  await page.goto('https://twitter.com/jimcramer', {
    waitUntil: 'networkidle2',
  });

  await page.waitForTimeout(3000);

  // await page.screenshot({ path: 'example.png' });

  const tweets = await page.evaluate(async () => {
    return document.body.innerText;
  });

  await browser.close();

  return tweets;
}

exports.helloWorld = functions.https.onRequest(async (request, response) => {
  // test logic here
  try {
    const tweets = await scrape();
    const gptCompletion = await openai.createCompletion("text-davinci-001", {
      prompt: `${tweets} Jim Cramer recommends selling the following stock tickers: `,
      // prompt: `Top five tech company stocks`,
      temperature: 0.7,
      max_tokens: 32,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0,
    });

    const stocksToBuy = gptCompletion.data.choices[0].text.match(/\b[A-Z]+\b/g);
    console.log(`Thanks for the tips Jim! ${stocksToBuy}`);
    response.send(stocksToBuy);
    if (!stocksToBuy) {
      console.log("sitting this one out");
      return null;
    }
  } catch (e) {
    console.log(e,"first error");
    response.send("error");
    
  }
  
  // try {
  //   const account = await alpaca.getAccount();
  //   console.log(`dry powder: ${account.buying_power}`);
  //   console.log("account init done");
  //   // place order
  //   const order = await alpaca.createOrder({
  //     // symbol: stocksToBuy[0],
  //     symbol: "AMD",
  //     qty: 1,
  //     // notional: account.buying_power * 0.9, // will buy fractional shares
  //     side: "buy",
  //     type: "market",
  //     time_in_force: "day",
  //   });

  //   console.log(`look mom i bought stonks: ${order.id}`);
    
  // } catch (e) {
  //   console.log(e,"error");
    
  // }
  
  
  

  // return null;

  
});
exports.Buy = functions.https.onRequest(async (request, response) => {
  // test logic here
  
  try {
    const account = await alpaca.getAccount();
    // console.log(`dry powder: ${account.buying_power}`);
    // console.log("account init done");
    // // place order
    // const order = await alpaca.createOrder({
    //   // symbol: stocksToBuy[0],
    //   symbol: "AMD",
    //   qty: 1,
    //   // notional: account.buying_power * 0.9, // will buy fractional shares
    //   side: "buy",
    //   type: "market",
    //   time_in_force: "day",
    // });
    
    console.log(`look mom i bought stonks: ${order.id}`);

  } catch (e) {
    console.log(e,"error");

  }

  return null;
});
exports.getRichQuick = functions
  .runWith({ memory: '4GB' })
  .pubsub.schedule('0 10 * * 1-5')
  .timeZone('America/New_York')
  .onRun(async (ctx) => {
    console.log('This will run M-F at 10:00 AM Eastern!');

    const tweets = await scrape();

    const gptCompletion = await openai.createCompletion('text-davinci-001', {
      prompt: `${tweets} Jim Cramer recommends selling the following stock tickers: `,
      temperature: 0.7,
      max_tokens: 32,
      top_p: 1,
      frequency_penalty: 0,
      presence_penalty: 0,
    });

    const stocksToBuy = gptCompletion.data.choices[0].text.match(/\b[A-Z]+\b/g);
    console.log(`Thanks for the tips Jim! ${stocksToBuy}`);

    if (!stocksToBuy) {
      console.log('sitting this one out');
      return null;
    }

    //// ALPACA Make Trades ////

    // close all positions
    const cancel = await alpaca.cancelAllOrders();
    const liquidate = await alpaca.closeAllPositions();

    // get account
    const account = await alpaca.getAccount();
    console.log(`dry powder: ${account.buying_power}`);

    // place order
    const order = await alpaca.createOrder({
      symbol: stocksToBuy[0],
      // qty: 1,
      notional: account.buying_power * 0.9, // will buy fractional shares
      side: 'buy',
      type: 'market',
      time_in_force: 'day',
    });

    console.log(`look mom i bought stonks: ${order.id}`);

    return null;
  });
