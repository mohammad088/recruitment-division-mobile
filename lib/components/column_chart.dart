import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/config.dart';

class ColumnChart extends StatelessWidget {
  ColumnChart({super.key});
  final List<ChartData> list = [
    ChartData(2000, 'jan'),
    ChartData(322, 'feb'),
    ChartData(328, 'mar'),
    ChartData(3255, 'apr'),
    ChartData(1412, 'may'),
    ChartData(6344, 'jun'),
    ChartData(2342, 'jul'),
    ChartData(1234, 'aug'),
  ];
  final List<ChartData> list2 = [
    ChartData(2342, 'jan'),
    ChartData(3225, 'feb'),
    ChartData(2359, 'may'),
    ChartData(5232, 'mar'),
    ChartData(7887, 'apr'),
    ChartData(5787, 'jun'),
    ChartData(2565, 'jul'),
    ChartData(2465, 'aug'),
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      color: Colors.white,
      width: Config.screenWidth! * 3 / 4,
      height: Config.screenHeight! * 2 / 4,
      child: SfCartesianChart(
          legend: Legend(isVisible: true),
          title: ChartTitle(
              text: 'Visit and Sales Statistics',
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              alignment: ChartAlignment.near),
          margin: const EdgeInsets.all(15),
          primaryXAxis: CategoryAxis(
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              labelRotation: 25),
          primaryYAxis: NumericAxis(isVisible: false),
          palette: const <Color>[
            Colors.blue,
            Colors.orange,
            Colors.green
          ],
          series: <ChartSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
                legendItemText: 'Bar1',
                animationDuration: 3.0,
                dataSource: list2,
                spacing: 0.3,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                xValueMapper: (ChartData ch, _) => ch.month,
                yValueMapper: (ChartData ch, _) => ch.num),
            ColumnSeries<ChartData, String>(
                legendItemText: 'Bar2',
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                animationDuration: 3.0,
                dataSource: list,
                spacing: 0.3,
                xValueMapper: (ChartData ch, _) => ch.month,
                yValueMapper: (ChartData ch, _) => ch.num),
            ColumnSeries<ChartData, String>(
                legendItemText: 'Bar3',
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                animationDuration: 3.0,
                dataSource: list,
                spacing: 0.3,
                xValueMapper: (ChartData ch, _) => ch.month,
                yValueMapper: (ChartData ch, _) => ch.num)
          ]),
    );
  }
}

class ChartData {
  final int num;
  final String month;

  ChartData(this.num, this.month);
}
