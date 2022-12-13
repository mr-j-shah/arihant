import 'dart:convert';
import 'package:http/http.dart' as http;

class client {
  String id, name, address, mobileno, doj;
  int amount, totalam, penaltyday, day, collectam, remainingamount;
  client(
      {required this.name,
      required this.id,
      required this.mobileno,
      required this.address,
      required this.doj,
      required this.amount,
      required this.day,
      required this.penaltyday,
      required this.collectam,
      required this.remainingamount,
      required this.totalam});

  Future<bool> adddata() async {
    final res = await http.post(
      Uri.parse('http://bhimshaktivicharmanch.com/arihant/addclient.php'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        <String, dynamic>{
          'id': id,
          'name': name,
          'doj': doj,
          'address': address,
          'mobileno': mobileno,
          'amount': amount,
          'totalamount': totalam,
          'days': day,
          'collectionamount': collectam,
          'penalty': penaltyday,
          'remainingamount': remainingamount
        },
      ),
    );
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Fail");
      return false;
    }
  }
}
