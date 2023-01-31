import 'package:arihant/api/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  bool isLoading = true;
  String _name = "";
  String _email = "";
  String _address = "";
  String _mobile = "";
  String _image = "";
  int _screencount = 1;

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    // collector c = await SessionManager().get("data");
    collector c = collector.fromJson(await await SessionManager().get("data"));
    print(c.image);
    setState(() {
      _name = c.name.toString();
      _email = c.email.toString();
      _address = c.address.toString();
      _mobile = c.mobile.toString();
      _image = c.image.toString();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child:
                CircularProgressIndicator(color: Color.fromRGBO(36, 59, 85, 1)),
          )
        : ListView(
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
                          "http://bhimshaktivicharmanch.com/arihant/files/$_image",
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
                    _name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 34),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: Text(
                  _address,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: Text(
                  _mobile,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: Text(
                  _email,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
  }
}
