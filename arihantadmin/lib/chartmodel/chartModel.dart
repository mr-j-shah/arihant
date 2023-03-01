import 'dart:convert';
import 'package:http/http.dart' as http;

class DailyCollection {
  String date;
  int Total;
  DailyCollection({required this.date, required this.Total});
}

ConverterDailyCollection(Map<String, dynamic> c) {
  return DailyCollection(date: c["date"], Total: int.parse(c["total"]));
}

List<DailyCollection> listToObjDailyCollection(List<dynamic> list) {
  List<DailyCollection> collection = [];
  for (var i in list) {
    DailyCollection data = ConverterDailyCollection(i);
    collection.add(data);
  }
  return collection;
}

Future<List<DailyCollection>> DailyTotalCollection() async {
  List<DailyCollection> collection = [];
  final response = await http.post(
    Uri.parse(
        'http://bhimshaktivicharmanch.com/arihant/getDailyCollectionTotal.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'email': 'daxay2310@gmail.com',
      },
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    List<dynamic> res = jsonDecode(response.body);
    collection = listToObjDailyCollection(res);
  } else {
    print("Fail");
  }
  return collection;
}
