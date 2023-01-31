// ignore_for_file: camel_case_types, must_be_immutable, deprecated_member_use

import 'package:arihantadmin/collector/collector_api.dart';
import 'package:arihantadmin/collector/edit_collector.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class collector_profile extends StatefulWidget {
  collector_profile({super.key, required this.c});
  collector c;
  @override
  State<collector_profile> createState() => _collector_profileState();
}

class _collector_profileState extends State<collector_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => edit_collector(c: widget.c),
                ),
              ).then((value) {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        elevation: 0,
        title: const Text("Collector Profile"),
        backgroundColor: const Color.fromRGBO(36, 59, 85, 1),
      ),
      body: ListView(
        children: [
          SizedBox(
            // ignore: sort_child_properties_last
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    color: Color.fromRGBO(36, 59, 85, 1),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "http://bhimshaktivicharmanch.com/arihant/files/${widget.c.image}",
                    ),
                    radius: 70,
                  ),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.30,
            width: double.maxFinite,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Center(
              child: Text(
                widget.c.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 34),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: Text(
              widget.c.address,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            onTap: () {
              launch("tel://${widget.c.mobile}");
            },
            leading: const Icon(Icons.call),
            title: Text(
              widget.c.mobile,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: Text(
              widget.c.email,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.money_outlined),
            title: Text(
              widget.c.dailyCollAmount,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
