import 'package:flutter/material.dart';
import 'package:rive_animation/api/stockmarketApi.dart';
import 'package:rive_animation/model/ChartSampleData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockChart extends StatefulWidget {
  final List<ChartSampleData> stockDataList;

  StockChart({required this.stockDataList});

  @override
  _StockChartState createState() => _StockChartState();
}

class _StockChartState extends State<StockChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            CandleSeries<ChartSampleData, String>(
              dataSource: widget.stockDataList,
              xValueMapper: (ChartSampleData stock, _) => stock.x.toString(),
              lowValueMapper: (ChartSampleData stock, _) => stock.low,
              highValueMapper: (ChartSampleData stock, _) => stock.high,
              openValueMapper: (ChartSampleData stock, _) => stock.open,
              closeValueMapper: (ChartSampleData stock, _) => stock.close,
            ),
          ],
        ),
      ),
    );
  }
}
