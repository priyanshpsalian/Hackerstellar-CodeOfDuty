const fetch = require('node-fetch');

const apiKey = '<YOUR_API_KEY>'; // replace with your own API key
const apiUrl = '<API_ENDPOINT>'; // replace with the OpenAPI endpoint URL
const searchTerm = 'example'; // replace with your search term

fetch(`${apiUrl}?q=${searchTerm}`, {
  method: 'GET',
  headers: {
    'Content-Type': 'application/json',
    'x-api-key': apiKey,
  },
})
  .then((response) => {
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    return response.json();
  })
  .then((data) => {
    console.log(data); // do something with the response data
  })
  .catch((error) => {
    console.error(error);
  });
