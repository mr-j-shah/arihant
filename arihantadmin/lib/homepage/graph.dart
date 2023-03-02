import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../chartmodel/chartModel.dart';

class graph extends StatefulWidget {
  const graph({super.key});

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  List<dynamic> data = [];
  List<DailyCollection> chart1 = [];
  List<CollectorCollection> chart2 = [];
  List<NewClientTotal> chart3 = [];
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await DailyTotalCollection().then((value) {
      data = value;
    });
    chart1 = listToObjDailyCollection(data[0]);
    chart2 = listToObjCollectorCollection(data[1]);
    chart3 = listToObjNewClientTotal(data[2]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        // ignore: prefer_const_constructors
        ? Center(
            // ignore: prefer_const_constructors
            child: CircularProgressIndicator(
              color: const Color.fromRGBO(36, 59, 85, 1),
            ),
          )
        : ListView(
            children: [
              chart1.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SfCartesianChart(
                          tooltipBehavior: TooltipBehavior(enable: true),
                          title: ChartTitle(
                              text: "Collection of last 4 days",
                              textStyle: TextStyle(fontSize: 18)),
                          borderColor: Colors.black,
                          plotAreaBackgroundColor: Colors.white60,
                          primaryXAxis: CategoryAxis(
                              arrangeByIndex:
                                  true // Arranges the series base on the axis index values
                              ),
                          series: <ChartSeries<DailyCollection, String>>[
                            // PieSeries(),
                            // Renders column chart
                            ColumnSeries<DailyCollection, String>(
                                dataSource: chart1,
                                xValueMapper: (DailyCollection data, _) =>
                                    data.date,
                                yValueMapper: (DailyCollection data, _) =>
                                    data.Total)
                          ],
                        ),
                      ),
                    ),
              chart2.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SfCircularChart(
                          legend: Legend(
                              position: LegendPosition.bottom,
                              isVisible: true,
                              overflowMode: LegendItemOverflowMode.wrap),
                          borderColor: Colors.black,
                          title: ChartTitle(
                              text: "Today Collection by Collector",
                              textStyle: TextStyle(fontSize: 18)),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CircularSeries>[
                            // Renders doughnut chart
                            DoughnutSeries<CollectorCollection, String>(
                              dataSource: chart2,
                              xValueMapper: (CollectorCollection data, _) =>
                                  data.email,
                              yValueMapper: (CollectorCollection data, _) =>
                                  data.Total,
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              chart3.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SfCartesianChart(
                          tooltipBehavior: TooltipBehavior(enable: true),
                          title: ChartTitle(
                              text: "New Account Sum of Amount",
                              textStyle: TextStyle(fontSize: 18)),
                          borderColor: Colors.black,
                          plotAreaBackgroundColor: Colors.white60,
                          primaryXAxis: CategoryAxis(
                              arrangeByIndex:
                                  true // Arranges the series base on the axis index values
                              ),
                          series: <ChartSeries<NewClientTotal, String>>[
                            // PieSeries(),
                            // Renders column chart
                            ColumnSeries<NewClientTotal, String>(
                                dataSource: chart3,
                                xValueMapper: (NewClientTotal data, _) =>
                                    data.date,
                                yValueMapper: (NewClientTotal data, _) =>
                                    data.Total)
                          ],
                        ),
                      ),
                    ),
            ],
          );
  }
}
