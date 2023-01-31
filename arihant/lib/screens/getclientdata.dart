// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:arihant/screens/addaccount.dart';
import 'package:arihant/screens/getClientAccountList.dart';

import 'package:arihant/api/clientapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:searchfield/searchfield.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/authentication.dart';

class getClientData extends StatefulWidget {
  getClientData({super.key, required this.c});
  client c;
  @override
  State<getClientData> createState() => _getClientDataState();
}

class _getClientDataState extends State<getClientData> {
  List<client> clientList = [];

  bool isDetail = false;
  String _email = "", doj = "";
  late String address, mobileNo;
  String _clientName = "", _clientAccNo = "";
  List<String> idList = [];
  bool isSelected = false;
  bool isComplete = true;
  late int noofacc = 0, amountTillNow = 0, remAmountTillNow = 0, penalty = 0;
  List<Map<String, dynamic>> accountList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Client Details"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: ListView(children: [
        SizedBox(
          // ignore: sort_child_properties_last
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)),
                  color: Color.fromRGBO(36, 59, 85, 1),
                ),
                height: MediaQuery.of(context).size.height * 0.10,
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.10,
          width: double.maxFinite,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Center(
            child: Text(
              widget.c.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 34),
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: Text(
            widget.c.id.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          title: Text(
            widget.c.address,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        ListTile(
          onTap: () {
            launch("tel://${widget.c.mobileno}");
          },
          leading: const Icon(Icons.call),
          title: Text(
            widget.c.mobileno,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.black,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Date Of Joining: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.doj,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Text(
                "Date of Last Update: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.updatedate,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Text(
                "Total Amount: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.amount.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Text(
                "Remaining Amount: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.remainingamount.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Text(
                "Penalty Days: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.penaltyday.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const Text(
                "Number of Account: ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(36, 59, 85, 1),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  // ignore: prefer_const_constructors
                  child: Text(
                    widget.c.noOfAcc.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: double.maxFinite,
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => getClientAccountList(
                      c: widget.c,
                    ),
                  ),
                );
              }),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1.5,
                color: Colors.blue[50],
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Data of Account [${widget.c.noOfAcc} Account]",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: double.maxFinite,
            child: InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => addaccount(c: widget.c),
                  ),
                ).then((value) {
                  Navigator.pop(context);
                });
              }),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1.5,
                color: Colors.blue[50],
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Add Account",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
