import 'package:flutter/material.dart';
import 'package:rive_animation/model/stock.dart';
import 'package:rive_animation/sampledata/chartsample.dart';

import 'StockScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController();

  late List<Stock> _stocks;
  late List<Stock> _filteredStocks;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _sustainabilityScoreController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _isTopSelected = false;

  bool _isScrolled = false;

  void _generateStocks() {
    _stocks = [
      Stock(
        symbol: 'AAPL',
        name: 'Apple Inc.',
        industry: 'Technology',
        price: 143.06,
        sustainabilityScore: 70.0,
        isTop: true,
      ),
      Stock(
        symbol: 'AMZN',
        name: 'Amazon.com Inc.',
        industry: 'Retail',
        price: 3372.20,
        sustainabilityScore: 65.0,
        isTop: true,
      ),
      Stock(
        symbol: 'MSFT',
        name: 'Microsoft Corporation',
        industry: 'Technology',
        price: 258.49,
        sustainabilityScore: 72.5,
        isTop: false,
      ),
      Stock(
        symbol: 'JPM',
        name: 'JPMorgan Chase & Co.',
        industry: 'Finance',
        price: 153.27,
        sustainabilityScore: 62.0,
        isTop: false,
      ),
      Stock(
        symbol: 'GOOGL',
        name: 'Alphabet Inc.',
        industry: 'Technology',
        price: 2290.56,
        sustainabilityScore: 68.5,
        isTop: true,
      ),
      Stock(
        symbol: 'BRK-A',
        name: 'Berkshire Hathaway Inc.',
        industry: 'Finance',
        price: 422800.00,
        sustainabilityScore: 55.0,
        isTop: false,
      ),
      Stock(
        symbol: 'NVDA',
        name: 'NVIDIA Corporation',
        industry: 'Technology',
        price: 597.17,
        sustainabilityScore: 75.0,
        isTop: false,
      ),
      Stock(
        symbol: 'PG',
        name: 'Procter & Gamble Co.',
        industry: 'Consumer Goods',
        price: 135.61,
        sustainabilityScore: 78.0,
        isTop: false,
      ),
    ];

    _filteredStocks = _stocks;
  }

  @override
  void initState() {
    super.initState();
    _generateStocks();
  }

  void _filterStocks() {
    String? name =
        _nameController.text.isNotEmpty ? _nameController.text : null;
    double? price = _priceController.text.isNotEmpty
        ? double.tryParse(_priceController.text)
        : null;
    String? industry =
        _industryController.text.isNotEmpty ? _industryController.text : null;
    double? sustainabilityScore = _sustainabilityScoreController.text.isNotEmpty
        ? double.tryParse(_sustainabilityScoreController.text)
        : null;

    _filteredStocks = _stocks.where((stock) {
      if (name != null && !stock.name.contains(name)) return false;
      if (price != null && stock.price != price) return false;
      if (industry != null && !stock.industry.contains(industry)) return false;
      if (sustainabilityScore != null &&
          stock.sustainabilityScore != sustainabilityScore) return false;

      return true;
    }).toList();

    setState(() {});
  }

  void _sortStocks() {
    _filteredStocks.sort((a, b) => b.price.compareTo(a.price));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration:
                          const InputDecoration(hintText: 'Filter by name'),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: 'Filter by price'),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _industryController,
                      decoration:
                          const InputDecoration(hintText: 'Filter by industry'),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _sustainabilityScoreController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Filter by sustainability score'),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _filterStocks,
                          child: const Text('Filter'),
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: _sortStocks,
                          child: const Text('Sort'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                    itemCount: _filteredStocks.length,
                    itemBuilder: (context, index) {
                      final stock = _filteredStocks[index];
                      return Card(
                        elevation: 2,
                        color: stock.isTop ? Colors.green : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StockView(
                                  stockDataList: getChartData(),
                                  score: stock.sustainabilityScore,
                                  name: stock.name,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${stock.symbol} - ${stock.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                '${stock.industry} - ${stock.price} - ${stock.sustainabilityScore}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
