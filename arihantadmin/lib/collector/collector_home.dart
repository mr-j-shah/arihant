// ignore_for_file: camel_case_types

import 'package:arihantadmin/collector/collector_api.dart';
import 'package:arihantadmin/collector/edit_collector.dart';
import 'package:flutter/material.dart';

class collector_home extends StatefulWidget {
  const collector_home({super.key});

  @override
  State<collector_home> createState() => _collector_homeState();
}

class _collector_homeState extends State<collector_home> {
  List<collector> list = [
    collector(
        address: "Sachin",
        email: "shahjinay02@gmail.com",
        image: "",
        mobile: "+919978530638",
        dailyCollAmount: "1000",
        name: "Jinay Shah")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collector"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: double.maxFinite,
              child: InkWell(
                onTap: (() {}),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 1.5,
                  color: Colors.blue[50],
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Add New Collector",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                edit_collector(c: list[index]),
                          ),
                        );
                      },
                      // ignore: prefer_const_constructors
                      title: Text(
                        list[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    );
                  })
              //     ListView(
              //   children: [
              //     ListTile(
              //       onTap: () {},
              //       // ignore: prefer_const_constructors
              //       title: Text(
              //         "Jinay Shah",
              //         style: const TextStyle(
              //             fontWeight: FontWeight.w500, fontSize: 18),
              //       ),
              //     ),
              //     // ignore: prefer_const_constructors

              //     ListTile(
              //       onTap: () {},
              //       // ignore: prefer_const_constructors
              //       title: Text(
              //         "Daxay Shah",
              //         style: const TextStyle(
              //             fontWeight: FontWeight.w500, fontSize: 18),
              //       ),
              //     ),
              //   ],
              // )
              ),
        ],
      ),
    );
  }
}
