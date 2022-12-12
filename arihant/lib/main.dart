import 'dart:async';
import 'package:arihant/screens/home.dart';
import 'package:arihant/screens/login.dart';
import 'package:arihant/screens/spleshscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arihant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _islogin = false;
  @override
  void initState() {
    checksession().then((value) {
      _islogin = value;
    });
    Timer(const Duration(seconds: 5), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _islogin ? const homepage() : const login(),
        ),
      );
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const spleshscreen();
  }

  Future<bool> checksession() async {
    dynamic id = await SessionManager().get("username");
    if (id != null) {
      return true;
    }
    return false;
  }
}
