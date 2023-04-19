const request = require("request");

const options = {
  method: "GET",
  url: "https://alpha-vantage.p.rapidapi.com/query",
  qs: { function: "GLOBAL_QUOTE", symbol: "MSFT", datatype: "json" },
  headers: {
    "X-RapidAPI-Key": "27a69cf21amsh325a8ba16cf714bp155393jsn0ee108a31352",
    "X-RapidAPI-Host": "alpha-vantage.p.rapidapi.com",
    useQueryString: true,
  },
};

request(options, function (error, response, body) {
  if (error) throw new Error(error);

  console.log(body);
});
