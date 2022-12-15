import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> addpenalty(String id) async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/addpenalty.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{'id': id},
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    if (response.body == "Success") {
      return true;
    }
    return false;
  } else {
    return false;
  }
}

Future<bool> addcollectionapi(String id, String collectionid, String email,
    int collectionamount, String date, String accountno) async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/addcollection.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'collectionid': collectionid,
        'id': id,
        'date': date,
        'email': email,
        'collectionamount': collectionamount,
        'accountno': accountno
      },
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    if (response.body == "Success") {
      return true;
    }
    return false;
  } else {
    return false;
  }
}
