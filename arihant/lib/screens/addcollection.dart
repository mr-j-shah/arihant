// ignore_for_file: camel_case_types

import 'package:arihant/api/clientapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';

class addcollection extends StatefulWidget {
  const addcollection({super.key});

  @override
  State<addcollection> createState() => _addcollectionState();
}

class _addcollectionState extends State<addcollection> {
  List<client> clientList = [];
  bool isLoading = true;
  String _date = "";
  String _name = "";
  String _email = "";
  @override
  void initState() {
    getdata();

    super.initState();
  }

  getdata() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    dynamic email = await SessionManager().get("email");
    dynamic name = await SessionManager().get("name");
    setState(() {
      isLoading = false;
      _date = formatted;
      _name = name.toString();
      _email = email.toString();
    });
    getclinet(_email).then((value) {
      clientList = value;
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
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    enabled: false,
                    cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                    initialValue: _date,
                    decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        // ignore: prefer_const_constructors
                        borderSide: BorderSide(
                            color: const Color.fromRGBO(36, 59, 85, 1)),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
  }
}
