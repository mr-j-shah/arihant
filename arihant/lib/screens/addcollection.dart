// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addcollection extends StatefulWidget {
  const addcollection({super.key});

  @override
  State<addcollection> createState() => _addcollectionState();
}

class _addcollectionState extends State<addcollection> {
  bool isLoading = true;
  String _date = "";
  @override
  void initState() {
    getdata();
    super.initState();
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

  getdata() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    setState(() {
      isLoading = false;
      _date = formatted;
    });
  }
}
