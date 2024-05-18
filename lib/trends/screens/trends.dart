import 'package:flutter/material.dart';
import 'package:naukrified/roles_data_analysis.dart/widgets/charts.dart';
import 'package:naukrified/trends/firebase/trends.dart';
import 'package:naukrified/trends/model/trend.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TrendScreen extends StatefulWidget {
  const TrendScreen({super.key});

  @override
  State<TrendScreen> createState() => _TrendScreenState();
}

class _TrendScreenState extends State<TrendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getTrendsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Center(child: Icon(Icons.time_to_leave));
          }
          return TrendWidget(trend: snapshot.data!);
        },
      ),
    );
  }
}

class TrendWidget extends StatefulWidget {
  TrendWidget({Key? key, required this.trend}) : super(key: key);
  Trends? trend;
  @override
  State<TrendWidget> createState() => _TrendWidgetState();
}

class _TrendWidgetState extends State<TrendWidget> {
  Map<String, List<DataPoint>> data = {};

  List<DataPoint> convertData(Map<String, double> data) {
    List<DataPoint> convertedData = [];

    // First, convert the map entries into DataPoint objects
    data.forEach((key, value) {
      List<String> dateComponents = key.split('-');

      int year = int.parse(dateComponents[0]);
      int month = int.parse(dateComponents[1]);
      int day = int.parse(dateComponents[2]);
      if (_startDate == null ||
          _endDate == null ||
          (DateTime(year, month, day).isAfter(_startDate!) &&
              DateTime(year, month, day).isBefore(_endDate!))) {
        // print(DateTime(year, month, day));
        convertedData
            .add(DataPoint(date: DateTime(year, month, day), count: value));
      }
    });

    // Then, sort the DataPoint list by date
    convertedData.sort((a, b) => a.date.compareTo(b.date));

    return convertedData;
  }

  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    data['jobSelected'] = convertData(widget.trend!.jobSelected);
    data['jobApplied'] = convertData(widget.trend!.jobApplied);
    data['jobPosted'] = convertData(widget.trend!.jobPosted);
    data['averageSalary'] = convertData(widget.trend!.averageSalary);
  }

  DateTime? _startDate;
  DateTime? _endDate;
  @override
  Widget build(BuildContext context) {
    return widget.trend != null
        ? SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                    onPressed: () async {
                      final dateRange = await showDateRangePicker(
                          context: context,
                          firstDate:
                              DateTime.now().subtract(Duration(days: 800)),
                          lastDate: DateTime.now());
                      if (dateRange != null) {
                        setState(() {
                          _startDate = dateRange.start;
                          _endDate = dateRange.end;
                          print(_startDate!.day);
                          data['jobSelected'] =
                              convertData(widget.trend!.jobSelected);
                          data['jobApplied'] =
                              convertData(widget.trend!.jobApplied);
                          data['jobPosted'] =
                              convertData(widget.trend!.jobPosted);
                          data['averageSalary'] =
                              convertData(widget.trend!.averageSalary);
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month)),
                SizedBox(
                    height: 300,
                    child: SfCartesianChart(
                        primaryXAxis: DateTimeAxis(),
                        // Chart title
                        title: ChartTitle(text: "Jobs Posted"),
                        // Enable tooltip
                        tooltipBehavior: _tooltipBehavior,
                        series: <LineSeries<DataPoint, DateTime>>[
                          LineSeries<DataPoint, DateTime>(
                              dataSource: data['jobPosted'],
                              xValueMapper: (DataPoint data, _) => data.date,
                              yValueMapper: (DataPoint data, _) => data.count,
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ])
                    // SfCartesianChart(
                    //   primaryXAxis: DateTimeAxis(),
                    //   series: <ChartSeries>[
                    //     LineSeries<MapEntry<String, int>, DateTime>(
                    //       dataSource: _mapToList(widget.trend.averageSalary),
                    //       xValueMapper: (MapEntry<String, int> entry, _) =>
                    //           DateTime.parse(entry.key),
                    //       yValueMapper: (MapEntry<String, int> entry, _) =>
                    //           entry.value,
                    //       name: 'Average Salary',
                    //     ),
                    //   ],
                    // ),
                    ),
                SizedBox(
                  height: 300,
                  child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(),
                      // Chart title
                      title: ChartTitle(text: "Jobs Selected"),
                      // Enable tooltip
                      tooltipBehavior: _tooltipBehavior,
                      series: <LineSeries<DataPoint, DateTime>>[
                        LineSeries<DataPoint, DateTime>(
                            dataSource: data['jobSelected'],
                            xValueMapper: (DataPoint data, _) => data.date,
                            yValueMapper: (DataPoint data, _) => data.count,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),
                SizedBox(
                  height: 300,
                  child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(),
                      // Chart title
                      title: ChartTitle(text: "Jobs Applied"),
                      // Enable tooltip
                      tooltipBehavior: _tooltipBehavior,
                      series: <LineSeries<DataPoint, DateTime>>[
                        LineSeries<DataPoint, DateTime>(
                            dataSource: data['jobApplied'],
                            xValueMapper: (DataPoint data, _) => data.date,
                            yValueMapper: (DataPoint data, _) => data.count,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),
                SizedBox(
                  height: 300,
                  child: SfCartesianChart(
                      primaryXAxis: DateTimeAxis(),
                      // Chart title
                      title: ChartTitle(text: "Average Salary"),
                      // Enable tooltip
                      tooltipBehavior: _tooltipBehavior,
                      series: <LineSeries<DataPoint, DateTime>>[
                        LineSeries<DataPoint, DateTime>(
                            dataSource: data['averageSalary'],
                            xValueMapper: (DataPoint data, _) => data.date,
                            yValueMapper: (DataPoint data, _) => data.count,
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true))
                      ]),
                ),
              ],
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  // Helper function to convert Map to List of MapEntry for chart data
  List<MapEntry<String, int>> _mapToList(Map<String, int> map) {
    return map.entries
        .map((entry) => MapEntry(entry.key, entry.value))
        .toList();
  }
}
