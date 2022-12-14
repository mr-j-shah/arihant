import 'dart:convert';
import 'package:http/http.dart' as http;

class client {
  String id, name, address, mobileno, doj;
  int amount, totalam, penaltyday, day, collectam, remainingamount;

  String updatedate;
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
      required this.totalam,
      required this.updatedate});

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

Converter(Map<String, dynamic> c) {
  return client(
      name: c["name"],
      id: c["id"],
      mobileno: c["mobileno"],
      address: c["address"],
      doj: c["doj"],
      amount: int.parse(c["amount"]),
      day: int.parse(c["days"]),
      penaltyday: int.parse(c["penalty"]),
      collectam: int.parse(c["collectionamount"]),
      remainingamount: int.parse(c["remainingamount"]),
      totalam: int.parse(c["totalamount"]),
      updatedate: c["updatedate"]);
}

List<client> listToObj(List<dynamic> list) {
  List<client> clientList = [];
  for (var i in list) {
    client data = Converter(i);
    clientList.add(data);
  }
  return clientList;
}

Future<List<client>> getclinet(String email) async {
  List<client> datalist = [];
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/getclient.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{'email': email},
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    print("Success");
    List<dynamic> res = jsonDecode(response.body);
    datalist = listToObj(res);
  } else {
    print("Fail");
  }
  return datalist;
}
