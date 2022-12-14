import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> verifyotp() async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/getclient.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{'email': 'shahjinay02@gmail.co'},
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    print("Success");

    List<dynamic> res = jsonDecode(response.body);
  } else {
    print("Fail");
  }
}

Future<void> deletecart(String mobileno) async {
  final response = await http.post(
    Uri.parse('https://washim.aquaakshara.in/api/send_otp.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'mobileno': mobileno,
        'email': "shahjinay02@gmail.com",
      },
    ),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("Success");
  } else {
    print("Fail");
  }
}

Future<void> main(List<String> args) async {
  await verifyotp();
}
