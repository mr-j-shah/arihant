// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:arihant/screens/getClientAccountList.dart';
import 'package:http/http.dart' as http;
import 'package:arihant/api/clientapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:searchfield/searchfield.dart';

class getClientData extends StatefulWidget {
  const getClientData({super.key});

  @override
  State<getClientData> createState() => _getClientDataState();
}

class _getClientDataState extends State<getClientData> {
  List<client> clientList = [];
  bool isLoading = true;
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
    getdata();
    super.initState();
  }

  getdata() async {
    dynamic email = await SessionManager().get("email");
    setState(() {
      _email = email.toString();
    });
    await getclinet(_email).then((value) {
      clientList = value;
    });
    for (var data in clientList) {
      String value = "${data.name} [${data.id}]";
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
        title: const Text("Client Details"),
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
                                  _clientName = clientList[index].name;
                                  _clientAccNo = clientList[index].id;
                                  noofacc = clientList[index].noOfAcc;
                                  amountTillNow = clientList[index].amount;
                                  remAmountTillNow =
                                      clientList[index].remainingamount;
                                  penalty = clientList[index].penaltyday;
                                  mobileNo = clientList[index].mobileno;
                                  address = clientList[index].address;
                                  doj = clientList[index].doj;
                                  isSelected = true;
                                });
                              }
                            },
                            maxSuggestionsInViewPort: 6,
                            itemHeight: 50,
                          ),
                        ),
                  isSelected
                      ? Container(
                          margin: const EdgeInsets.all(8.0),
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
                                  ListTile(
                                    leading: const Icon(
                                      Icons.person_outline,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      _clientName.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black26,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.numbers,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      _clientAccNo.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black26,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.home,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      address,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black26,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTile(
                                    onTap: (() async {
                                      // if (!await launchUrlString(
                                      //     'www.google.com',
                                      //     mode: LaunchMode.inAppWebView)) {
                                      //   throw 'Could not launch';
                                      // }
                                    }),
                                    leading: const Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      mobileNo,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black26,
                                    thickness: 2,
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  ListTile(
                                    leading: const Icon(
                                      Icons.date_range,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      doj.toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  isSelected
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.all(5.0),
                                    // width: width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 1.5,
                                      color: Colors.white70,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "Total Remaining Amount: ",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    36, 59, 85, 1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  remAmountTillNow.toString(),
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.all(5.0),
                                    // width: width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 1.5,
                                      color: Colors.white70,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "Total Tacken Amount: ",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    36, 59, 85, 1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  amountTillNow.toString(),
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
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.all(5.0),
                                    // width: width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 1.5,
                                      color: Colors.white70,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "No. Of Account : ",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    36, 59, 85, 1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  noofacc.toString(),
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
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    margin: const EdgeInsets.all(5.0),
                                    // width: width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      elevation: 1.5,
                                      color: Colors.white70,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              "Penalty: ",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    36, 59, 85, 1),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Center(
                                                child: Text(
                                                  penalty.toString(),
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
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(),
                  isSelected
                      ? Container(
                          margin: const EdgeInsets.all(5),
                          // width: width,
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          getClientAccountList(
                                              clientAccNo: _clientAccNo)));
                            }),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 1.5,
                              color: Colors.blue[50],
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  // ignore: prefer_const_constructors
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Text(
                                      "Get Data of Account (Click Here)",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
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
}
