class Stock {
  final String symbol;
  final String name;
  final String industry;
  final double price;
  final double sustainabilityScore;
  final bool isTop;

  Stock({
    required this.symbol,
    required this.name,
    required this.industry,
    required this.price,
    required this.sustainabilityScore,
    required this.isTop,
  });
}
