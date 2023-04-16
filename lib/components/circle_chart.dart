import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/config.dart';

class CircleChart extends StatelessWidget {
  CircleChart({super.key});
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
        child: SfCircularChart(
          legend: Legend(isVisible: true),
          title: ChartTitle(
              text: 'Traffic Source',
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              alignment: ChartAlignment.near),
          series: <CircularSeries>[
            DoughnutSeries<ChartData, String>(
              dataSource: list2,
              xValueMapper: (ChartData ch, _) => ch.month,
              yValueMapper: (ChartData ch, _) => ch.num,
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
            )
          ],
        ));
  }
}

class ChartData {
  final int num;
  final String month;

  ChartData(this.num, this.month);
}
