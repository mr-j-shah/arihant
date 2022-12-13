import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';

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
