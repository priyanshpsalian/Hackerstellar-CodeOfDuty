import 'dart:convert';

StockSearchModel stockSearchModelFromJson(String str) =>
    StockSearchModel.fromJson(json.decode(str));

String stockSearchModelToJson(StockSearchModel data) =>
    json.encode(data.toJson());

class StockSearchModel {
  StockSearchModel({
    required this.results,
    required this.total,
  });

  List<Result> results;
  int total;

  factory StockSearchModel.fromJson(Map<String, dynamic> json) =>
      StockSearchModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total": total,
      };
}

class Result {
  Result({
    required this.name,
    required this.symbol,
    required this.shortBio,
    required this.region,
    required this.securityType,
  });

  String name;
  String symbol;
  String shortBio;
  String region;
  String securityType;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        symbol: json["symbol"],
        shortBio: json["shortBio"],
        region: json["region"],
        securityType: json["securityType"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "shortBio": shortBio,
        "region": region,
        "securityType": securityType,
      };
}
