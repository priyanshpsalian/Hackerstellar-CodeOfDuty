import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../model/StockModel.dart';

/// This function makes a request to the Alpha Vantage API
/// and returns the response as a string.

var uri = Uri.parse(
    'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
var request = http.Request('GET', uri);
var key = request.headers["X-RapidAPI-Key"] =
    "6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed";
var host = request.headers["X-RapidAPI-Host"] = "alpha-vantage.p.rapidapi.com";
final Client _client = Client();
getConferences() async {
  Response response = await _client.get(Uri.parse('$uri'));
  if (response.statusCode == 200) {
    final List result = jsonDecode(response.body)["Time Series (5min)"];
    print(result);
    return result.map((e) => StockModel.fromJson(e)).toList();
  } else {
    throw Exception(response.reasonPhrase);
  }
}

Future<Map<String, dynamic>> getTimeSeriesData() async {
  var uri = Uri.parse(
      'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
  var request = http.Request('GET', uri);
  var key = request.headers["X-RapidAPI-Key"] =
      "6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed";
  var host =
      request.headers["X-RapidAPI-Host"] = "alpha-vantage.p.rapidapi.com";
  final url = Uri.parse('https://your-api-url-here.com');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final timeSeries = jsonResponse['Time Series (5min)'];

    return timeSeries;
  } else {
    throw Exception('Failed to load data');
  }
}

makeRequestVoid() async {
  // Create the request
  var uri = Uri.parse(
      'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
  var request = http.Request('GET', uri);
  request.headers['X-RapidAPI-Key'] =
      '6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed';
  request.headers['X-RapidAPI-Host'] = 'alpha-vantage.p.rapidapi.com';

  // Make the request
  var response = await request.send();

  // Check the response
  if (response.statusCode == HttpStatus.ok) {
    // Read the response
    var responseBody = await response.stream.bytesToString();
    print(responseBody);
    // return responseBody;
  } else {
    // Log the error
    print('Error getting data: ${response.statusCode}');
    // return "null";
  }
}
// Future<String> makeRequest() async {
// // Create the request
//   var uri = Uri.parse(
//       'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
//   var request = http.Request('GET', uri);
//   request.headers['X-RapidAPI-Key'] =
//       '6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed';
//   request.headers['X-RapidAPI-Host'] = 'alpha-vantage.p.rapidapi.com';

// // Make the request
//   var response = await request.send();

// // Check the response
//   if (response.statusCode == HttpStatus.ok) {
// // Read the response
//     var responseBody = await response.stream.bytesToString();
//     var json = jsonDecode(responseBody);
//     var timeSeries =
//         json["Time Series (5min)"]; // get only the "time series" data
//     var timeSeriesJson = jsonEncode(timeSeries); // convert to JSON string
//     print(timeSeriesJson);
//     return timeSeriesJson;
//   } else {
// // Log the error
//     print('Error getting data: ${response.statusCode}');
//     return "null";
//   }
// }
// // Future<String> makeRequest() async {
// //   // Create the request
// //   var uri = Uri.parse(
// //       'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
// //   var request = http.Request('GET', uri);
// //   request.headers['X-RapidAPI-Key'] =
// //       '6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed';
// //   request.headers['X-RapidAPI-Host'] = 'alpha-vantage.p.rapidapi.com';

// //   // Make the request
// //   var response = await request.send();

// //   // Check the response
// //   if (response.statusCode == HttpStatus.ok) {
// //     // Read the response
// //     var responseBody = await response.stream.bytesToString();
// //     print(responseBody);
// //     return responseBody;
// //   } else {
// //     // Log the error
// //     print('Error getting data: ${response.statusCode}');
// //     return "null";
// //   }
// // }

class StockData {
  String symbol;
  String interval;
  Map<DateTime, Map<String, String>> timeSeries;

  StockData(
      {required this.symbol, required this.interval, required this.timeSeries});

  factory StockData.fromJson(Map<String, dynamic> json) {
    Map<DateTime, Map<String, String>> timeSeries = {};
    var timeSeriesJson = json['Time Series (5min)'] as Map<String, dynamic>;
    timeSeriesJson.forEach((key, value) {
      var date = DateTime.parse(key);
      var values = Map<String, String>.from(value);
      timeSeries[date] = values;
    });

    return StockData(
      symbol: json['Meta Data']['2. Symbol'],
      interval: json['Meta Data']['4. Interval'],
      timeSeries: timeSeries,
    );
  }
}

Future<StockData?> makeRequest() async {
  // Create the request
  var uri = Uri.parse(
      'https://alpha-vantage.p.rapidapi.com/query?interval=5min&function=TIME_SERIES_INTRADAY&symbol=MSFT&datatype=json&output_size=compact');
  var request = http.Request('GET', uri);
  request.headers['X-RapidAPI-Key'] =
      '6312fe48d7msh4433e98377d31d4p1aada4jsnee6f298b96ed';
  request.headers['X-RapidAPI-Host'] = 'alpha-vantage.p.rapidapi.com';

  // Make the request
  var response = await request.send();

  // Check the response
  if (response.statusCode == HttpStatus.ok) {
    // Read the response
    var responseBody = await response.stream.bytesToString();
    var json = jsonDecode(responseBody);

    var stockData = StockData.fromJson(json);
    print(stockData.symbol);
    print(stockData.interval);
    print(stockData.timeSeries);

    return stockData;
  } else {
    // Log the error
    print('Error getting data: ${response.statusCode}');
    return null;
  }
}
