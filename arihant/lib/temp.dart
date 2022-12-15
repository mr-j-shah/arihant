import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> verifyotp() async {
  final response = await http.post(
    Uri.parse(
        'http://bhimshaktivicharmanch.com/arihant/gettodaycollection.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        // 'collectionid': '9973818',
        // 'id': '2022-12-14:1-48:BHAV',
        'date': '2022-12-15',
        'email': 'daxay2310@gmail.com',
        // 'collectionamount': '200'
      },
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    if (response.body == "Success") {
      print("Success");
    }
    // List<dynamic> res = jsonDecode(response.body);
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
