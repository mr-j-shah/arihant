// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:arihant/api/clientapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:searchfield/searchfield.dart';

import 'addaccount.dart';

class getClientAccountList extends StatefulWidget {
  getClientAccountList({super.key, required this.c});
  client c;
  @override
  State<getClientAccountList> createState() => _getClientAccountListState();
}

class _getClientAccountListState extends State<getClientAccountList> {
  List<client> clientList = [];
  bool isLoading = true;

  List<Map<String, dynamic>> accountList = [];
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await getAccountData(widget.c.id).then((value) {
      accountList = value;
    });
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: InkWell(
                        onTap: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => addaccount(
                                c: widget.c,
                              ),
                            ),
                          ).then((value) {
                            setState(() {
                              getdata();
                            });
                          });
                        }),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1.5,
                          color: Colors.blue[50],
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Add New Account",
                              style: TextStyle(
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
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: accountList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (() {}),
                          child: accountListDesign(
                            index: index,
                            accountList: accountList,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Future<List<Map<String, dynamic>>> getAccountData(String clientId) async {
    List<Map<String, dynamic>> data = [];
    final response = await http.post(
      Uri.parse(
          'http://bhimshaktivicharmanch.com/arihant/getClientAccount.php'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        <String, dynamic>{'clientid': clientId},
      ),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      data = converter(jsonDecode(response.body));
    } else {
      print("Fail");
    }
    return data;
  }

  List<Map<String, dynamic>> converter(List<dynamic> c) {
    List<Map<String, dynamic>> data = [];
    for (var i in c) {
      Map<String, dynamic> oneData = {
        'accountNo': i["accountno"],
        'doc': i["doc"],
        'amount': i["amount"],
        'remAmount': i["remAmount"],
        'days': i["days"],
        'collection': i["collection"]
      };
      data.add(oneData);
    }
    return data;
  }
}

class accountListDesign extends StatelessWidget {
  accountListDesign(
      {super.key, required this.index, required this.accountList});
  int index;
  List<Map<String, dynamic>> accountList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 1.5,
        color: index % 2 == 0 ? Colors.green[50] : Colors.red[50],
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                "Account Number: ",
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
                    accountList[index]["accountNo"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const Text(
                "Date of Creation: ",
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
                    accountList[index]["doc"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const Text(
                "Amount: ",
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
                    accountList[index]["amount"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 2,
                indent: 20,
                endIndent: 20,
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
                    accountList[index]["remAmount"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const Text(
                "Remainig Days: ",
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
                    accountList[index]["days"].toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.black26,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              const Text(
                "Collection: ",
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
                    accountList[index]["collection"].toString(),
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
    );
  }
}
