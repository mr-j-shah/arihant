// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:arihantadmin/client/clientapi.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'addaccount.dart';
import 'addclient.dart';
import 'getclientdata.dart';

class client_home extends StatefulWidget {
  const client_home({super.key});

  @override
  State<client_home> createState() => _client_homeState();
}

class _client_homeState extends State<client_home> {
  String _name = "";
  String _email = "";
  bool isLoading = true;
  List<client> clientList = [];
  List<client> fullList = [];
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    await getclinet(_email).then((value) {
      fullList = value;
      clientList = value;
    });
    print(clientList.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collector"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromRGBO(36, 59, 85, 1),
              ),
            )
          : Column(
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
                            builder: (context) => const addclient(),
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
                            "Add New Client",
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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: TextFormField(
                      onChanged: ((value) {
                        List<client> list = <client>[];
                        for (client c in fullList) {
                          List<client> results = [];
                          if (value.isEmpty) {
                            // if the search field is empty or only contains white-space, we'll display all users
                            results = fullList;
                          } else {
                            results = clientList
                                .where(
                                  (user) => user.name.toLowerCase().contains(
                                        value.toLowerCase(),
                                      ),
                                )
                                .toList();
                            // we use the toLowerCase() method to make it case-insensitive
                          }

                          // Refresh the UI
                          setState(() {
                            clientList = results;
                          });
                        }
                      }),
                      cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                      decoration: InputDecoration(
                        hintText: "Client Name for Search",
                        labelText: "Search",
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
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: clientList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Dismissible(
                            confirmDismiss: (direction) async {
                              if (direction == DismissDirection.endToStart) {
                                launch("tel://${clientList[index].mobileno}");
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          addaccount(c: clientList[index])),
                                ).then((value) {
                                  setState(() {
                                    getdata();
                                  });
                                });
                              }
                            },
                            background: Container(
                              color: Colors.green,
                              child: Align(
                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      " Add Account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.orange,
                              child: Align(
                                // ignore: sort_child_properties_last
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      "Call",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                alignment: Alignment.centerRight,
                              ),
                            ),
                            key: Key(clientList[index].name),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        getClientData(c: clientList[index]),
                                  ),
                                ).then((value) {
                                  setState(() {
                                    getdata();
                                  });
                                });
                              },
                              // ignore: prefer_const_constructors
                              title: Text(
                                clientList[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
