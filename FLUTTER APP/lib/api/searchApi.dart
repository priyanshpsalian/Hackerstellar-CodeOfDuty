import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rive_animation/main.dart';

/// Function to make a GET request to the RapidAPI Stock Search API
///
/// [query] is the query string to search for stocks
/// [searchMetadata] is a boolean value to determine if the search should include metadata
/// [size] is the number of results to return
/// [offset] is the offset of the results to return
Future<String> getStocks(
    String query, bool searchMetadata, int size, int offset) async {
  // Create the URL for the request
  var url = Uri.parse(
      'https://stocksearch.p.rapidapi.com/api/v2/stocks?query=$query&searchMetadata=$searchMetadata&size=$size&offset=$offset');

  // Create the request
  var response = await http.get(url, headers: {
    'X-RapidAPI-Key': 'SIGN-UP-FOR-KEY',
    'X-RapidAPI-Host': 'stocksearch.p.rapidapi.com'
  });

  // Check for errors
  if (response.statusCode != 200) {
    print('Error getting stocks: ${response.statusCode}');
  }

  // Return the response body
  return response.body;
}

void main() async {
  // Make the request
  var responseBody = await getStocks('pizza hut', true, 5, 0);
  // Parse the response
  var responseJson = jsonDecode(responseBody);

  // Print the response
  print(responseJson);
}
