// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';

import '../api/authentication.dart';
import '../api/todaycollectionapi.dart';

class collectiondata extends StatefulWidget {
  const collectiondata({super.key});

  @override
  State<collectiondata> createState() => _collectiondataState();
}

class _collectiondataState extends State<collectiondata> {
  late String _date, _name, _email;
  List<todaydata> clientList = [];
  bool isLoading = true;
  int totalAmount = 0;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    collector c = collector.fromJson(await await SessionManager().get("data"));
    setState(() {
      _date = formatted;
      _name = c.name.toString();
      _email = c.email.toString();
    });
    await gettodaycollectionapi(_email, _date).then((value) {
      clientList = value;
    });
    print(clientList.length);
    for (var i in clientList) {
      totalAmount += i.collectionAmount;
    }
    print(totalAmount);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Today Collection"),
      //   backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      // ),
      body: isLoading
          // ignore: prefer_const_constructors
          ? Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(
                color: const Color.fromRGBO(36, 59, 85, 1),
              ),
            )
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                    // width: width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 1.5,
                      color: Colors.blue[50],
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Total Collection Amount: ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(36, 59, 85, 1),
                              ),
                            ),
                            Center(
                              child: Text(
                                totalAmount.toString(),
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: clientList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  clientList[index].id,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                const Divider(
                                  color: Colors.black87,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Text(
                                  clientList[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
