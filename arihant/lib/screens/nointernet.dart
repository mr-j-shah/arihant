// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class nointernet extends StatelessWidget {
  const nointernet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Arihant"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Nointernet.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("No Internet Connection"),
            ),
          ],
        ),
      ),
    );
  }
}
