// ignore_for_file: camel_case_types

import 'package:arihant/api/addclientapi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addclient extends StatefulWidget {
  const addclient({super.key});

  @override
  State<addclient> createState() => _addclientState();
}

class _addclientState extends State<addclient> {
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _address = new TextEditingController();
  final TextEditingController _mobile = new TextEditingController();
  final TextEditingController _amount = new TextEditingController();
  final TextEditingController _totalamount = new TextEditingController();
  final TextEditingController _day = new TextEditingController();
  final TextEditingController _colleamount = new TextEditingController();
  bool isLoading = true;
  bool isAmountAdded = false;
  bool isComplete = false;
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
                autovalidateMode: AutovalidateMode.always,
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
                      controller: _name,
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          isComplete = false;
                          return 'Enter a Name';
                        } else {
                          isComplete = true;
                          return null;
                        }
                      }),
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: const TextStyle(color: Colors.black),
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
                      controller: _address,
                      validator: ((value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 20) {
                          isComplete = false;
                          return 'Enter a Proper Address';
                        } else {
                          isComplete = true;
                          return null;
                        }
                      }),
                      maxLines: 6,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: _date,
                      decoration: InputDecoration(
                        labelText: "Address",
                        labelStyle: const TextStyle(color: Colors.black),
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
                      controller: _mobile,
                      validator: ((value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 10) {
                          isComplete = false;
                          return 'Enter a Mobile Number';
                        } else {
                          isComplete = true;
                          return null;
                        }
                      }),
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Mobile Number",
                        labelStyle: const TextStyle(color: Colors.black),
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
                      onChanged: ((value) {
                        // ignore: unnecessary_null_comparison
                        if (value == null || value == "" || value.isEmpty) {
                          _amount.text = "0";
                        } else {
                          _amount.text = value;
                          calculate();
                        }
                        print(_amount.text);
                        setState(() {
                          isAmountAdded = true;
                        });
                      }),
                      validator: ((value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.parse(value) < 5000) {
                          isComplete = false;
                          return 'Enter a Amount';
                        } else {
                          isComplete = true;
                          return null;
                        }
                      }),
                      keyboardType: TextInputType.number,
                      // enabled: false,
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      // initialValue: ,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        labelStyle: const TextStyle(color: Colors.black),
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
                  isAmountAdded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _totalamount,
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                isComplete = false;
                                return 'Enter a Total Amount';
                              } else {
                                isComplete = true;
                                return null;
                              }
                            }),
                            keyboardType: TextInputType.number,
                            // enabled: false,
                            cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                            // initialValue: ,
                            decoration: InputDecoration(
                              labelText: "Total Amount",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Colors.green),
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
                      : Container(),
                  isAmountAdded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            initialValue: "100",
                            onChanged: ((value) {
                              _day.text = value;
                              // changeday(_day.text);
                            }),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                isComplete = false;
                                return 'Enter a Days';
                              } else {
                                isComplete = true;
                                return null;
                              }
                            }),
                            // enabled: false,
                            keyboardType: TextInputType.number,
                            cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                            // initialValue: ,
                            decoration: InputDecoration(
                              labelText: "Days",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Colors.green),
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
                      : Container(),
                  isAmountAdded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _colleamount,
                            onChanged: ((value) {}),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                isComplete = false;
                                return 'Enter a Collection Amount';
                              } else {
                                isComplete = true;
                                return null;
                              }
                            }),
                            keyboardType: TextInputType.number,
                            // enabled: false,
                            cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                            // initialValue: ,
                            decoration: InputDecoration(
                              labelText: "Collection Amount",
                              labelStyle: const TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: Colors.green),
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
                      : Container(),
                  isAmountAdded
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (() async {
                              String name = _name.text;
                              String id =
                                  "$_date:${name[0].toUpperCase()}${name[1].toUpperCase()}${name[2].toUpperCase()}";
                              client cli = client(
                                name: _name.text,
                                id: id,
                                mobileno: _mobile.text,
                                address: _address.text,
                                doj: _date.toString(),
                                amount: int.parse(_amount.text),
                                day: int.parse(_day.text),
                                penaltyday: 0,
                                collectam:
                                    double.parse(_colleamount.text).toInt(),
                                remainingamount:
                                    double.parse(_totalamount.text).toInt(),
                                totalam:
                                    double.parse(_totalamount.text).toInt(),
                              );
                              if (isComplete) {
                                bool dataAdded = await cli.adddata();
                                if (dataAdded) {
                                  print("Data Added");
                                }
                              }
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              width: 240,
                              height: 60,
                              decoration: BoxDecoration(
                                  // ignore: prefer_const_constructors
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      const Color.fromRGBO(20, 30, 48, 1),
                                      const Color.fromRGBO(36, 59, 85, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Adagio Sans",
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          ),
                        )
                      : Container(),
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

  calculate() {
    int amunt = int.parse(_amount.text);
    double totalamount = amunt * 1.2;
    double collectamount = totalamount / 100;
    setState(() {
      _day.text = "100";
      _totalamount.text = totalamount.toString();
      _colleamount.text = collectamount.toString();
    });
  }

  // changeday(String s) {
  //   int days = int.parse(s);
  //   double totalamount = double.parse(_totalamount.text);
  //   double collectamount = totalamount / 100;
  //   setState(() {
  //     _colleamount.text = collectamount.toString();
  //   });
  // }
}
