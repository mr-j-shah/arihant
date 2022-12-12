import 'package:flutter/material.dart';

// ignore: camel_case_types
class spleshscreen extends StatelessWidget {
  const spleshscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 72, 70, 109),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          // ignore: prefer_const_constructors
          child: Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
