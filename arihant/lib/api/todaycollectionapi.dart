import 'dart:convert';
import 'package:http/http.dart' as http;

class todaydata {
  String collectionid, name, id;
  int collectionAmount;
  todaydata(
      {required this.collectionid,
      required this.id,
      required this.name,
      required this.collectionAmount});
}

Convertercollection(Map<String, dynamic> c) {
  return todaydata(
    name: c["name"],
    id: c["id"],
    collectionAmount: int.parse(c["collectionamount"]),
    collectionid: c["collectionid"],
  );
}

List<todaydata> listToObj(List<dynamic> list) {
  List<todaydata> dataList = [];
  for (var i in list) {
    todaydata data = Convertercollection(i);
    dataList.add(data);
  }
  return dataList;
}

Future<List<todaydata>> gettodaycollectionapi(String email, String date) async {
  List<todaydata> dataList = [];
  final response = await http.post(
    Uri.parse(
        'http://bhimshaktivicharmanch.com/arihant/gettodaycollection.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'date': date,
        'email': email,
      },
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    List<dynamic> res = jsonDecode(response.body);
    dataList = listToObj(res);
  } else {
    print("Fail");
  }
  return dataList;
}
