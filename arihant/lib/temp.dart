import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> verifyotp() async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/login.php'),
    // headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'username': 'daxay2310@gmail.com',
        'password': 'daxay',
        // 'username': '', 'password': password
        // 'firstname': 'Jinay',
        // 'lastname': 'Shah',
        // 'mobile': '9978530638',

        // 'name': 'Jinay',
        // 'doj': '2022-12-15',
        // 'address': 'Sachin',
        // 'mobileno': '9978530638',
        // 'amount': '10000',
        // 'noofacc': '1',
        // 'penalty': '0',
        // 'remainingamount': '12000',
        // 'updatedat': '2022-12-15',
        // 'amount': '40000',
        // 'rmamount': '50000',
        // 'updatedate': '2022-12-16',
        // 'noofacc': '2',
        // 'collectionid': '9973818',
        // 'id': '2022-12-14:1-48:BHAV',
        // 'date': '2022-12-15',
        // 'email': 'daxay2310@gmail.com',
        // 'collectionamount': '200'
      },
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    // Map<String, dynamic> res = jsonDecode(response.body);
    // print(res["status"]);
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
