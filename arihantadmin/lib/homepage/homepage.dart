import 'package:arihantadmin/collector/collector_home.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arihant Admin"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
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
            accountName: Text("Admin"),
            //TO DO change from a Session Management
            accountEmail: Text("admin@gmail.com"),
            //TO DO Chnage from a Session Management
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(
              'Client',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const addclient(),
              //   ),
              // );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text(
              'Collector',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const collector_home(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.data_object),
            title: const Text(
              'Get Client Details',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const getClientData(),
              //   ),
              // );
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
              // await SessionManager().destroy();
              // // ignore: use_build_context_synchronously
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const login(),
              //   ),
              // );
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
                        setState(() {});
                      },
                      icon: const Icon(Icons.home)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.add_circle_outline_sharp),
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {});
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
}
