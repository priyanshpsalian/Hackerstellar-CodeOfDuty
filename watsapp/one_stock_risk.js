// const request = require("request");

// const options = {
//   method: "GET",
//   url: "https://esg-risk-ratings-for-stocks.p.rapidapi.com/api/v1/resources/esg",
//   qs: { ticker: "TSLA" },
//   headers: {
//     "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
//     "X-RapidAPI-Host": "esg-risk-ratings-for-stocks.p.rapidapi.com",
//     useQueryString: true,
//   },
// };

// request(options, function (error, response, body) {
//   if (error) throw new Error(error);

//   console.log(body);
// });


// const axios = require("axios");

// const options = {
//   method: "GET",
//   url: "https://esg-risk-ratings-for-stocks.p.rapidapi.com/api/v1/resources/esg",
//   params: { ticker: "AAPL" },
//   headers: {
//     "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
//     "X-RapidAPI-Host": "esg-risk-ratings-for-stocks.p.rapidapi.com",
//   },
// };

// axios
//   .request(options)
//   .then(function (response) {
//     console.log(response.data);
//   })
//   .catch(function (error) {
//     console.error(error);
//   });


const fetch = require("node-fetch");

const url =
  "https://esg-risk-ratings-for-stocks.p.rapidapi.com/api/v1/resources/esg?ticker=AAPL";

const options = {
  method: "GET",
  headers: {
    "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
    "X-RapidAPI-Host": "esg-risk-ratings-for-stocks.p.rapidapi.com",
  },
};

fetch(url, options)
  .then((res) => res.json())
  .then((json) => console.log(json))
  .catch((err) => console.error("error:" + err));