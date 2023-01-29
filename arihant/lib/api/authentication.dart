import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class collector {
  late String name, email, mobile, address, image;
  collector(
      {required this.name,
      required this.email,
      required this.image,
      required this.address,
      required this.mobile});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["email"] = email;
    user["name"] = name;
    user["image"] = image;
    user["address"] = address;
    user["mobile"] = mobile;
    return user;
  }

  collector.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        image = json["image"],
        address = json["address"],
        mobile = json["mobile"];
}

// ignore: camel_case_types
class authentication {
  Future<bool> login(String email, String password) async {
    final res = await http.post(
      Uri.parse('http://bhimshaktivicharmanch.com/arihant/login.php'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        <String, dynamic>{
          'username': email,
          'password': password,
        },
      ),
    );
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      print("Success");
      Map<String, dynamic> resposne = jsonDecode(res.body);
      if (resposne["status"] == "success") {
        await SessionManager().set(
            "data",
            collector(
                name: resposne["name"],
                email: resposne["email"],
                image: resposne["image"],
                address: resposne["address"],
                mobile: resposne["mobile"]));
        await SessionManager().set("email", resposne["email"]);
        await SessionManager().set("name", resposne["name"]);
        return true;
      }
      return false;
    } else {
      print("Fail");
      return false;
    }
  }
}
