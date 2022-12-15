import 'dart:convert';
import 'package:http/http.dart' as http;

class client {
  String id, name, address, mobileno, doj;
  int amount, penaltyday, remainingamount, noOfAcc;
  String updatedate;
  client(
      {required this.name,
      required this.id,
      required this.mobileno,
      required this.address,
      required this.doj,
      required this.amount,
      required this.noOfAcc,
      required this.penaltyday,
      required this.remainingamount,
      required this.updatedate});

  Future<bool> addClient() async {
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
          'noofacc': noOfAcc,
          'penalty': penaltyday,
          'remainingamount': remainingamount,
          'updatedat': updatedate
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

class Account {
  String id, accountno;
  int amount, remAmount, days, collection;
  Account(
      {required this.id,
      required this.accountno,
      required this.amount,
      required this.collection,
      required this.days,
      required this.remAmount});

  Future<bool> adddAcc() async {
    final res = await http.post(
      Uri.parse('http://bhimshaktivicharmanch.com/arihant/addaccount.php'),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        <String, dynamic>{
          'id': id,
          'accountno': accountno,
          'amount': amount,
          'remAmount': remAmount,
          'days': days,
          'collection': collection
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

ConverterClient(Map<String, dynamic> c) {
  return client(
      name: c["name"],
      id: c["id"],
      mobileno: c["mobileno"],
      address: c["address"],
      doj: c["doj"],
      amount: int.parse(c["amount"]),
      noOfAcc: int.parse(c["noofacc"]),
      penaltyday: int.parse(c["penalty"]),
      remainingamount: int.parse(c["remainingamount"]),
      updatedate: c["updatedate"]);
}

List<client> listToObjClient(List<dynamic> list) {
  List<client> clientList = [];
  for (var i in list) {
    client data = ConverterClient(i);
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
    datalist = listToObjClient(res);
  } else {
    print("Fail");
  }
  return datalist;
}

ConverterAcc(Map<String, dynamic> c) {
  return Account(
    id: c["id"],
    accountno: c["accountno"],
    remAmount: int.parse(c["remAmount"]),
    days: int.parse(c["days"]),
    amount: int.parse(c["amount"]),
    collection: int.parse(c["collection"]),
  );
}

List<Account> listToObjAcc(List<dynamic> list) {
  List<Account> clientList = [];
  for (var i in list) {
    Account data = ConverterAcc(i);
    clientList.add(data);
  }
  return clientList;
}

Future<List<Account>> getcAcc(String email) async {
  List<Account> datalist = [];
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/getaccount.php'),
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
    datalist = listToObjAcc(res);
  } else {
    print("Fail");
  }
  return datalist;
}
