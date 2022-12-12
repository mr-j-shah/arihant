import 'package:arihant/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

// ignore: camel_case_types
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
        title: const Text("Arihant"),
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
            accountName: const Text("Jinay Shah"),
            //TO DO change from a Session Management
            accountEmail: const Text("shahjinay02@gmail.com"),
            //TO DO Chnage from a Session Management
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text(
              'Creat Clinet',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              'Today Collection',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {},
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
    );
  }
}
