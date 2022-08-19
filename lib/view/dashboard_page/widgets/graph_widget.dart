import 'package:flutter/material.dart';
import 'package:menskart_admin/model/dashboard_model/dashboard_model.dart';
import 'package:menskart_admin/view/core/border_radius.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidget extends StatelessWidget {
  final DashBoardModel? data;
  const GraphWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 400,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: kBRadius10),
        child: SfCartesianChart(
            title: ChartTitle(
              text: "Product Wise Sale Report :",
              alignment: ChartAlignment.near,
            ),
            primaryXAxis: CategoryAxis(
              isVisible: true,
              axisLine: const AxisLine(color: Colors.transparent),
              labelStyle: const TextStyle(fontSize: 10),
            ),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 600, interval: 100),
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                dataSource: chartdata,
                xValueMapper: (_ChartData data, _) => data.x,
                yValueMapper: (_ChartData data, _) => data.y,
                name: 'Sales Report',
              )
            ]));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

final chartdata = [
  _ChartData('Shirts', 200),
  _ChartData('Jeans', 200),
  _ChartData('Shoes', 100),
  _ChartData('T-Shirts', 80),
  // _ChartData('AUDI', 14),
  // _ChartData('SWIFT', 14),
  // _ChartData('LAMB', 100),
  // _ChartData('TES', 14),
];
