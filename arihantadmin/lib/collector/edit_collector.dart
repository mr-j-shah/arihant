// ignore_for_file: camel_case_types, must_be_immutable

import 'package:arihantadmin/collector/collector_api.dart';
import 'package:flutter/material.dart';

import '../homepage/homepage.dart';

class edit_collector extends StatefulWidget {
  edit_collector({super.key, required this.c});
  collector c;
  @override
  State<edit_collector> createState() => _edit_collectorState();
}

class _edit_collectorState extends State<edit_collector> {
  bool isComplete = false;
  bool isUpload = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  void initState() {
    _name.text = widget.c.name;
    _email.text = widget.c.email;
    _mobile.text = widget.c.mobile;
    _address.text = widget.c.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Collector"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: widget.c.name,
                  controller: _name,
                  validator: ((value) {
                    if (value == null || value.isEmpty) {
                      isComplete = false;
                      return 'Enter a Name';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  }),
                  // enabled: false,
                  cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                  // initialValue: ,
                  decoration: InputDecoration(
                    labelText: "Name",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: widget.c.address,
                  controller: _address,
                  validator: ((value) {
                    if (value == null || value.isEmpty || value.length < 20) {
                      isComplete = false;
                      return 'Enter a Proper Address';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  }),
                  maxLines: 6,
                  // enabled: false,
                  cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                  // initialValue: _date,
                  decoration: InputDecoration(
                    labelText: "Address",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // initialValue: widget.c.mobile,
                  controller: _mobile,
                  validator: ((value) {
                    String pattern = r"^(\+91[\-\s]?)?[0]?(91)?[789]\d{9}$";
                    RegExp regex = RegExp(pattern);
                    if (value == null ||
                        value.isEmpty ||
                        value.length < 10 ||
                        !regex.hasMatch(value)) {
                      isComplete = false;
                      return 'Enter a Mobile Number';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  }),
                  keyboardType: TextInputType.number,
                  // enabled: false,
                  cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                  // initialValue: ,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  enabled: false,
                  // initialValue: widget.c.email,
                  controller: _email,
                  validator: ((value) {
                    String pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = RegExp(pattern);
                    if (value == null ||
                        value.isEmpty ||
                        !regex.hasMatch(value)) {
                      isComplete = false;
                      return 'Enter a Email Id';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  }),
                  // keyboardType: TextInputType.number,
                  // enabled: false,
                  cursorColor: const Color.fromRGBO(36, 59, 85, 1),
                  // initialValue: ,
                  decoration: InputDecoration(
                    labelText: "Email",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      bool res = await updateCollector(
                        name: _name.text,
                        address: _address.text,
                        mobile: _mobile.text,
                        email: _email.text,
                      );
                      if (res) {
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const homepage(),
                        //   ),
                        // );
                      }
                    },
                    color: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Update",
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
