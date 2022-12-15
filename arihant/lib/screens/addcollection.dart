// ignore_for_file: camel_case_types
import 'package:arihant/api/clientapi.dart';
import 'package:arihant/api/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';

import 'home.dart';

class addcollection extends StatefulWidget {
  const addcollection({super.key});

  @override
  State<addcollection> createState() => _addcollectionState();
}

class _addcollectionState extends State<addcollection> {
  List<client> clientList = [];
  List<client> clientList2 = [];
  bool isLoading = true;
  String _date = "";
  String _name = "";
  String _email = "";
  late int _fixamount = 0;
  List<String> idList = [];
  bool isSelected = false;
  bool isComplete = true;
  final TextEditingController _id = TextEditingController();
  final TextEditingController _clientname = TextEditingController();
  final TextEditingController _collectionamount = TextEditingController();
  final TextEditingController _remainingamount = TextEditingController();
  final TextEditingController _days = TextEditingController();
  final TextEditingController _penaltydays = TextEditingController();
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
      if (data.day > 0) {
        idList.add(data.id);
        clientList2.add(data);
      }
    }
    print(idList.length);
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
                clientList2.isEmpty
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
                            labelText: "Client Id",
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
                            setState(() {
                              _id.text = val.item.toString();
                            });
                            bool check = idList.contains(val.item);
                            print(check);
                            if (check == true) {
                              print("contains");
                              int index = idList.indexOf(val.item.toString());
                              setState(() {
                                _clientname.text = clientList2[index].name;
                                _collectionamount.text =
                                    clientList2[index].collectam.toString();
                                _fixamount = clientList2[index].collectam;
                                _remainingamount.text = clientList2[index]
                                    .remainingamount
                                    .toString();
                                _days.text = clientList2[index].day.toString();
                                _penaltydays.text =
                                    clientList2[index].penaltyday.toString();
                                isSelected = true;
                              });
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
                          controller: _clientname,
                          enabled: false,
                          cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                          // initialValue: _date,
                          decoration: InputDecoration(
                            labelText: "Client Name",
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
                            setState(() {
                              if (_fixamount > int.parse(value)) {
                                isComplete = false;
                              } else {
                                isComplete = true;
                              }
                            });
                          }),
                          keyboardType: TextInputType.number,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Amount";
                            }
                            return null;
                          }),
                          controller: _collectionamount,
                          // enabled: false,
                          cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                          // initialValue: _date,
                          decoration: InputDecoration(
                            labelText: "Collection Amount",
                            labelStyle: const TextStyle(color: Colors.black),
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
                          controller: _remainingamount,
                          enabled: false,
                          cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                          // initialValue: _date,
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
                          controller: _days,
                          enabled: false,
                          cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                          // initialValue: _date,
                          decoration: InputDecoration(
                            labelText: "Remaining Days",
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
                          controller: _penaltydays,
                          enabled: false,
                          cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                          // initialValue: _date,
                          decoration: InputDecoration(
                            labelText: "Penalty Days",
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
                        child: InkWell(
                          onTap: (() async {
                            if (isComplete) {
                              final DateTime now = DateTime.now();
                              final DateFormat formatter =
                                  DateFormat('yyyy-MM-dd:H-mm-ss');
                              final String formatted = formatter.format(now);
                              bool status = await addcollectionapi(
                                  _id.text,
                                  formatted,
                                  _email,
                                  int.parse(_collectionamount.text),
                                  _date);
                              if (status) {
                                await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Collection"),
                                    content: Text(
                                        'Collection is added for ID No:${_id.text}'),
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
                              }
                            } else {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Error"),
                                  content: Text(
                                      'Collection Amount is Less then Decided for ID No:${_id.text}'),
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
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            width: 240,
                            height: 60,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(86, 171, 47, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Collect",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Adagio Sans",
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                isSelected
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (() async {
                            bool status = await addpenalty(_id.text);
                            if (status) {
                              await showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Penalty"),
                                  content: Text(
                                      'Penalty is added for ID No:${_id.text}'),
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
                            }
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            width: 240,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "Penalty",
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
          );
  }
}
