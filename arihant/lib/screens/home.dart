import 'package:arihant/screens/addaccount.dart';
import 'package:arihant/screens/addclient.dart';
import 'package:arihant/screens/addcollection.dart';
import 'package:arihant/screens/client/client_home.dart';
import 'package:arihant/screens/getclientdata.dart';
import 'package:arihant/screens/graph.dart';
import 'package:arihant/screens/login.dart';
import 'package:arihant/screens/user.dart';
import 'package:arihant/screens/usermanual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../api/authentication.dart';
import 'todaycollection.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool isLoading = true;
  String _name = "";
  String _email = "";
  int _screencount = 1;
  List<Widget> screens = [
    const collectiondata(),
    const addcollection(),
    const user()
  ];
  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        // ignore: prefer_const_constructors
        ? Container(
            color: Colors.white,
            // ignore: prefer_const_constructors
            child: Center(
              // ignore: prefer_const_constructors
              child: CircularProgressIndicator(
                color: const Color.fromRGBO(36, 59, 85, 1),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text("Arihant"),
              backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
            ),
            body: screens[_screencount],
            drawer: Drawer(
              child: ListView(children: [
                // ignore: prefer_const_constructors
                UserAccountsDrawerHeader(
                  // ignore: prefer_const_constructors
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
                  ),
                  accountName: Text(_name),
                  //TO DO change from a Session Management
                  accountEmail: Text(_email),
                  //TO DO Chnage from a Session Management
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text(
                    'Client',
                    style: TextStyle(fontSize: 18),
                  ),
                  // ignore: prefer_const_constructors
                  // subtitle: Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  //   child: const Text(
                  //     'For new client create which is not in data.',
                  //     style: TextStyle(fontSize: 14),
                  //   ),
                  // ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const client_home(),
                      ),
                    );
                  },
                ),

                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text(
                    'User Manual',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const usermanual(),
                      ),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: () async {
                    await SessionManager().destroy();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const login(),
                      ),
                    );
                  },
                ),
              ]),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _screencount = 0;
                              });
                            },
                            icon: const Icon(Icons.home)),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _screencount = 1;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline_sharp),
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _screencount = 2;
                            });
                          },
                          icon: const Icon(Icons.account_box),
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.070,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                ),
              ),
            ),
          );
  }

  Future<void> getdata() async {
    collector c = collector.fromJson(await await SessionManager().get("data"));
    setState(() {
      _name = c.name.toString();
      _email = c.email.toString();
      isLoading = false;
    });
  }
}
