// ignore_for_file: camel_case_types

import 'package:arihant/api/clientapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';

import '../api/collection.dart';
import 'home.dart';

class addaccount extends StatefulWidget {
  const addaccount({super.key});

  @override
  State<addaccount> createState() => _addaccountState();
}

class _addaccountState extends State<addaccount> {
  List<client> clientList = [];
  bool isLoading = true;
  String _date = "";
  String _name = "";
  String _email = "";
  List<String> idList = [];
  bool isSelected = false;
  bool isComplete = true;
  bool isAmountAdded = false;
  late int noofacc = 0,
      amountTillNow = 0,
      remAmountTillNow = 0,
      amountWithAcc = 0,
      remAmountWithAcc = 0;
  final TextEditingController _id = TextEditingController();
  final TextEditingController _amount = new TextEditingController();
  final TextEditingController _totalamount = new TextEditingController();
  final TextEditingController _day = new TextEditingController();
  final TextEditingController _colleamount = new TextEditingController();
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
      _date = formatted;
      _name = name.toString();
      _email = email.toString();
    });
    await getclinet(_email).then((value) {
      clientList = value;
    });
    for (var data in clientList) {
      String value = data.id + " " + data.name;
      idList.add(value);
    }
    print(idList.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Account"),
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
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(36, 59, 85, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          // ignore: prefer_const_constructors
                          borderSide: BorderSide(
                              color: const Color.fromRGBO(36, 59, 85, 1)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  clientList.isEmpty
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: SearchField(
                            suggestionAction: SuggestionAction.unfocus,
                            suggestions: idList
                                .map(
                                  (e) => SearchFieldListItem<String>(
                                    e,
                                    item: e,
                                  ),
                                )
                                .toList(),
                            searchInputDecoration: InputDecoration(
                              labelStyle: const TextStyle(color: Colors.black),
                              labelText: "Client Id:",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(36, 59, 85, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(36, 59, 85, 1)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                            ),
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: "Cannot Be Empty"),
                            // ]),
                            onSuggestionTap: (val) {
                              print(val.item);
                              bool check = idList.contains(val.item);
                              print(check);
                              if (check == true) {
                                print("contains");
                                int index = idList.indexOf(val.item.toString());
                                setState(() {
                                  noofacc = clientList[index].noOfAcc;
                                  amountTillNow = clientList[index].amount;
                                  remAmountTillNow =
                                      clientList[index].remainingamount;
                                  isSelected = true;
                                  _id.text = clientList[index].id;
                                });
                                print(_id.text);
                              }
                            },
                            maxSuggestionsInViewPort: 6,
                            itemHeight: 50,
                          ),
                        ),
                  isSelected
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            // controller: _clientid,
                            enabled: false,
                            cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                            initialValue: remAmountTillNow.toString(),
                            decoration: InputDecoration(
                              labelText: "Remaining Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(36, 59, 85, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                // ignore: prefer_const_constructors
                                borderSide: BorderSide(
                                    color: const Color.fromRGBO(36, 59, 85, 1)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  isSelected
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            onChanged: ((value) {
                              // ignore: unnecessary_null_comparison
                              if (value == null ||
                                  value == "" ||
                                  value.isEmpty) {
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
                              labelText: "Amount for New Account",
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
                              labelText: "Total Amount for New Account",
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
                              labelText: "Days for New Account",
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
                                return 'Enter a Collection Amount for New Account';
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
                              labelText: "Collection Amount for New Account",
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
                              if (_amount.text.isEmpty ||
                                  _day.text.isEmpty ||
                                  _colleamount.text.isEmpty) {
                                isComplete = false;
                              }
                              if (isComplete) {
                                Account acc = Account(
                                    id: _id.text,
                                    accountno:
                                        _id.text + (noofacc + 1).toString(),
                                    amount: int.parse(_amount.text),
                                    collection:
                                        double.parse(_colleamount.text).toInt(),
                                    days: int.parse(_day.text),
                                    remAmount: double.parse(_totalamount.text)
                                        .toInt());

                                bool accCreate = await acc.adddAcc();
                                print(int.parse(_amount.text) + amountTillNow);
                                print(double.parse(_totalamount.text).toInt() +
                                    remAmountTillNow);
                                print(noofacc + 1);
                                bool updateclient = await updateClientApi(
                                    _id.text,
                                    int.parse(_amount.text) + amountTillNow,
                                    double.parse(_totalamount.text).toInt() +
                                        remAmountTillNow,
                                    _date,
                                    noofacc + 1);
                                if (accCreate) {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Add Client Form"),
                                      content: Text(
                                          'Clinet Created Successfully! ID No:${_id.text}' +
                                              'And Account No:${acc.accountno}'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'),
                                        )
                                      ],
                                    ),
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const homepage(),
                                    ),
                                  );
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Aleart"),
                                      content: const Text('Please Enter data'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('Ok'),
                                        )
                                      ],
                                    ),
                                  );
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
}
