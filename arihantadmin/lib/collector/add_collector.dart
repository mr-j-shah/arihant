// ignore_for_file: camel_case_types, must_be_immutable, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class add_collector extends StatefulWidget {
  const add_collector({
    super.key,
  });

  @override
  State<add_collector> createState() => _add_collectorState();
}

class _add_collectorState extends State<add_collector> {
  bool isComplete = false;
  bool isUpload = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  File? file;
  String imageUrl = "";
  dynamic email;
  late Response response;
  late String progress;
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Collector"),
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
                child: TextFormField(
                  validator: (ValueKey) {
                    if (ValueKey == null ||
                        ValueKey.isEmpty ||
                        ValueKey.length < 12) {
                      isComplete = false;
                      return 'Enter a Password \nPassword Must gratter than 12 letters';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  },
                  controller: _password,
                  style: const TextStyle(),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
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
                  validator: (ValueKey) {
                    if (ValueKey == null ||
                        ValueKey.isEmpty ||
                        ValueKey != _password.text) {
                      isComplete = false;
                      return 'Confirm Password must be same with Password';
                    } else {
                      isComplete = true;
                      return null;
                    }
                  },
                  controller: _confirmpassword,
                  style: const TextStyle(),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
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
              isUpload
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {},
                          color: Colors.green,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          // ignore: prefer_const_constructors
                          child: Text(
                            "Submit",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            file == null ? _getimage() : uploadFile();
                          },
                          color: Colors.orange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            file == null ? "Click an image" : "Upload Image",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getimage() async {
    PickedFile? pickedfile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxHeight: 1000,
        maxWidth: 1000,
        imageQuality: 30);

    setState(() {
      file = File(pickedfile!.path);
    });
  }

  uploadFile() async {
    String uploadurl =
        "http://kisanpariwar.com/aurangabad_first/imageupload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(file!.path,
          filename: basename(file!.path)
          //show only filename from path
          ),
    });

    response = await dio.post(
      uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          // ignore: prefer_interpolation_to_compose_strings
          progress = "$sent" +
              " Bytes of " "$total Bytes - " +
              percentage +
              " % uploaded";

          //update the progress
        });
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> res = response.data;
      print(res);
      if (!res["success"]) {
        print("inside block");
        setState(() {
          isUpload = true;
        });
      }
      print(response.toString());

      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }
}
