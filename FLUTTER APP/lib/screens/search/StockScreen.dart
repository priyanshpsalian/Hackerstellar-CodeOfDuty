// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/model/ChartSampleData.dart';

import 'package:rive_animation/screens/onboding/components/animated_btn.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockView extends StatefulWidget {
  final List<ChartSampleData> stockDataList;
  double score;
  String? name;
  StockView(
      {super.key,
      required this.stockDataList,
      required this.score,
      required this.name});

  @override
  State<StockView> createState() => _StockViewState();
}

class _StockViewState extends State<StockView> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    super.initState();
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
            ),
            const SizedBox(
              width: 200.0,
              height: 25.0,
            ),
            Center(
              child: SfCartesianChart(
                zoomPanBehavior: ZoomPanBehavior(),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries>[
                  CandleSeries<ChartSampleData, String>(
                    animationDuration: 2000,
                    showIndicationForSameValues: true,
                    isVisible: true,
                    isVisibleInLegend: true,
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
              animateFromLastPercent: true,
              animationDuration: 1000,
              footer: const Text(
                "Sustainability Score",
              ),
              radius: 60.0,
              lineWidth: 10.0,
              animation: true,
              percent: widget.score / 100,
              center: Text(
                "${widget.score}%",
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              backgroundColor: const Color.fromARGB(255, 215, 211, 211),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.redAccent,
            ),
            const SizedBox(height: 20),
            AnimatedBtn(
              text: "Buy",
              btnAnimationController: _btnAnimationController,
              press: () {
                _btnAnimationController.isActive = true;
                alertDialog(context, widget.score * 50);
              },
            ),
          ],
        ),
      ),
    );
  }

  void alertDialog(BuildContext context, double score) {
    var alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: Text(
          "Congratulations!\nYou have won a $score points!!!",
        ),
        content: Lottie.asset('assets/RiveAssets/67230-trophy-winner.json'));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
