// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables

import 'package:arihantadmin/collector/add_collector.dart';
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
        name: "Jinay Shah"),
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
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add_collector(),
                    ),
                  );
                }),
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
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Dismissible(
                      confirmDismiss: (direction) async {
                        if (direction == DismissDirection.endToStart) {
                          // TO DO call api
                        } else {
                          print(list[index]);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  edit_collector(c: list[index]),
                            ),
                          );
                        }
                      },
                      background: Container(
                        color: Colors.green,
                        child: Align(
                          // ignore: sort_child_properties_last
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <Widget>[
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              const Text(
                                " Edit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      secondaryBackground: Container(
                        color: Colors.orange,
                        child: Align(
                          // ignore: sort_child_properties_last
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              const Text(
                                "Call",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          alignment: Alignment.centerRight,
                        ),
                      ),
                      key: Key(list[index].name),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            "assets/images/Nointernet.png",
                          ),
                        ),
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
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
