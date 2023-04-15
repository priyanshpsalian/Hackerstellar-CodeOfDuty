const request = require("request");

const options = {
  method: "GET",
  url: "https://esg-risk-ratings-for-stocks.p.rapidapi.com/api/v1/resources/esg",
  qs: { ticker: "AAPL" },
  headers: {
    "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
    "X-RapidAPI-Host": "esg-risk-ratings-for-stocks.p.rapidapi.com",
    useQueryString: true,
  },
};

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
