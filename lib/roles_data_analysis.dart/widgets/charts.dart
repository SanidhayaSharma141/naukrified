import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class JobCharts extends StatefulWidget {
  JobCharts({super.key, required this.data, required this.heading});
  Map<String, double> data;
  String heading;

  @override
  State<JobCharts> createState() => JobChartsState();
}

List<DataPoint> convertData(Map<String, double> data) {
  List<DataPoint> convertedData = [];
  data.forEach((key, value) {
    List<String> dateComponents = key.split('-');

    int year = int.parse(dateComponents[0]);
    int month = int.parse(dateComponents[1]);
    int day = int.parse(dateComponents[2]);
    convertedData
        .add(DataPoint(date: DateTime(year, month, day), count: value));
  });
  convertedData.sort((a, b) => a.date.compareTo(b.date));
  return convertedData;
}

class DataPoint {
  final DateTime date;
  final double count;

  DataPoint({required this.date, required this.count});
}

class JobChartsState extends State<JobCharts> {
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    data = convertData(widget.data);
  }

  List<DataPoint> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width * 0.94,
      child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
          // Chart title
          title: ChartTitle(text: widget.heading),
          // Enable tooltip
          tooltipBehavior: _tooltipBehavior,
          series: <LineSeries<DataPoint, DateTime>>[
            LineSeries<DataPoint, DateTime>(
                dataSource: data,
                xValueMapper: (DataPoint data, _) => data.date,
                yValueMapper: (DataPoint data, _) => data.count,
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true))
          ]),
    );
  }
}
