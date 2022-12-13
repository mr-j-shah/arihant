// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addclient extends StatefulWidget {
  const addclient({super.key});

  @override
  State<addclient> createState() => _addclientState();
}

class _addclientState extends State<addclient> {
  bool isLoading = true;
  String _date = "";
  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Client"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: isLoading
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 6,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: _date,
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Total Amount",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // enabled: false,
                      keyboardType: TextInputType.number,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Days",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: ((value) {
                        if (value == null) {
                          return "Enter Collection amount";
                        }
                      }),
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Collection Amount",
                        labelStyle: TextStyle(color: Colors.black),
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
                  ),
                ]),
              ),
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
