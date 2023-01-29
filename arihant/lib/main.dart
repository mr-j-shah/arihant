// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:arihant/screens/home.dart';
import 'package:arihant/screens/login.dart';
import 'package:arihant/screens/nointernet.dart';
import 'package:arihant/screens/spleshscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'api/authentication.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  Connectivity connectivity = Connectivity();
  bool _islogin = false;
  bool _isconnected = false;
  @override
  void initState() {
    checksession().then((value) {
      _islogin = value;
    });
    Timer(const Duration(seconds: 3), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => _isconnected
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
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      _isconnected = true;
    }
    collector c = collector.fromJson(await await SessionManager().get("data"));
    dynamic id = c.email;
    if (id != null) {
      return true;
    }
    return false;
  }
}
