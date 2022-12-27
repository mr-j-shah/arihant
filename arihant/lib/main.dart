// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:arihant/screens/home.dart';
import 'package:arihant/screens/login.dart';
import 'package:arihant/screens/nointernet.dart';
import 'package:arihant/screens/spleshscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  var connectivityResult = new Connectivity().checkConnectivity();
  bool _islogin = false;
  @override
  void initState() {
    checksession().then((value) {
      _islogin = value;
    });
    Timer(const Duration(seconds: 3), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.wifi)
                  ? _islogin
                      ? const homepage()
                      : const login()
                  : const nointernet(),
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
    dynamic id = await SessionManager().get("email");
    if (id != null) {
      return true;
    }
    return false;
  }
}
