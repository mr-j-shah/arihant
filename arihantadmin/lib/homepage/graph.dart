import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../chartmodel/chartModel.dart';

class graph extends StatefulWidget {
  const graph({super.key});

  @override
  State<graph> createState() => _graphState();
}

class _graphState extends State<graph> {
  List<DailyCollection> data = [];
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
        : Column(
            children: [
              data.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: SfCartesianChart(
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
                                dataSource: data,
                                xValueMapper: (DailyCollection data, _) =>
                                    data.date,
                                yValueMapper: (DailyCollection data, _) =>
                                    data.Total)
                          ],
                        ),
                      ),
                    ),
            ],
          );
  }
}
