// ignore_for_file: camel_case_types, must_be_immutable

import 'package:arihantadmin/collector/collector_api.dart';
import 'package:flutter/material.dart';

class edit_collector extends StatefulWidget {
  edit_collector({super.key, required this.c});
  collector c;
  @override
  State<edit_collector> createState() => _edit_collectorState();
}

class _edit_collectorState extends State<edit_collector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Collector"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: Container(),
    );
  }
}
