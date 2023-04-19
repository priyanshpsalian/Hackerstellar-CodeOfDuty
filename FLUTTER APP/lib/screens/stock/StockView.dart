import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/model/ChartSampleData.dart';
import 'package:rive_animation/sampledata/chartsample.dart';
import 'package:rive_animation/screens/onboding/components/animated_btn.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockView extends StatefulWidget {
  final List<ChartSampleData> stockDataList;
  double score;
  String? name;
  StockView(
      {required this.stockDataList, required this.score, required this.name});

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.name!,
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            ),
            SizedBox(
              width: 200.0,
              height: 25.0,
            ),
            Center(
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  CandleSeries<ChartSampleData, String>(
                    dataSource: widget.stockDataList,
                    xValueMapper: (ChartSampleData stock, _) =>
                        stock.x.toString(),
                    lowValueMapper: (ChartSampleData stock, _) => stock.low,
                    highValueMapper: (ChartSampleData stock, _) => stock.high,
                    openValueMapper: (ChartSampleData stock, _) => stock.open,
                    closeValueMapper: (ChartSampleData stock, _) => stock.close,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 25.0,
            ),
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 10.0,
              animation: true,
              percent: widget.score / 100,
              center: Text(
                widget.score.toString() + "%",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              backgroundColor: Color.fromARGB(255, 215, 211, 211),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.redAccent,
            ),
            AnimatedBtn(
              text: "Buy",
              btnAnimationController: _btnAnimationController,
              press: () {
                _btnAnimationController.isActive = true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
