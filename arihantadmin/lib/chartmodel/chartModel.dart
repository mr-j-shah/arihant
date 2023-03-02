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

class NewClientTotal {
  String date;
  int Total;
  NewClientTotal({required this.date, required this.Total});
}

ConverterNewClientTotal(Map<String, dynamic> c) {
  return NewClientTotal(date: c["date"], Total: int.parse(c["total"]));
}

List<NewClientTotal> listToObjNewClientTotal(List<dynamic> list) {
  List<NewClientTotal> collection = [];
  for (var i in list) {
    NewClientTotal data = ConverterNewClientTotal(i);
    collection.add(data);
  }
  return collection;
}

class CollectorCollection {
  String email;
  int Total;
  CollectorCollection({required this.email, required this.Total});
}

ConverterCollectorCollection(Map<String, dynamic> c) {
  return CollectorCollection(
      email: c["email"], Total: int.parse(c["collectionToday"]));
}

List<CollectorCollection> listToObjCollectorCollection(List<dynamic> list) {
  List<CollectorCollection> collection = [];
  for (var i in list) {
    CollectorCollection data = ConverterCollectorCollection(i);
    collection.add(data);
  }
  return collection;
}

Future<List<dynamic>> DailyTotalCollection() async {
  List<dynamic> collection = [];
  final response = await http.get(
    Uri.parse(
        'http://bhimshaktivicharmanch.com/arihant/getDailyCollectionTotal.php'),
    headers: {"Content-Type": "application/json"},
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    collection = jsonDecode(response.body);
  } else {
    print("Fail");
  }
  return collection;
}

Future<Map<String, dynamic>> dashboardData() async {
  Map<String, dynamic> res = {};
  final response = await http.get(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/dashboard.php'),
    headers: {"Content-Type": "application/json"},
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    res = jsonDecode(response.body);
  } else {
    print("Fail");
  }
  return res;
}
