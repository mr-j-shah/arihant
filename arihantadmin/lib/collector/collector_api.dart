import 'dart:convert';
import 'package:http/http.dart' as http;

class collector {
  late String name, mobile, image, email, address, dailyCollAmount;
  collector(
      {required this.address,
      required this.email,
      required this.image,
      required this.mobile,
      required this.dailyCollAmount,
      required this.name});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["email"] = email;
    user["name"] = name;
    user["image"] = image;
    user["address"] = address;
    user["mobile"] = mobile;
    user["dailyCollAmount"] = dailyCollAmount;
    return user;
  }

  collector.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        image = json["image"],
        address = json["address"],
        mobile = json["mobile"],
        dailyCollAmount = json["dailyCollAmount"].toString();
}

Future<bool> addCollector(
    {required String name,
    required String address,
    required String mobile,
    required String email,
    required String password,
    required String image}) async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/addcollecotr.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'name': name,
        'address': address,
        'mobile': mobile,
        'email': email,
        'password': password,
        'image': image,
      },
    ),
  );
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200 && response.body == "Success") {
    return true;
  } else {
    print("Fail");
    return false;
  }
}

Future<bool> updateCollector({
  required String name,
  required String address,
  required String mobile,
  required String email,
}) async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/updateCollector.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{
        'name': name,
        'address': address,
        'mobile': mobile,
        'email': email,
      },
    ),
  );
  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 200 && response.body == "Success") {
    return true;
  } else {
    print("Fail");
    return false;
  }
}

Future<List<collector>> getcollectorlist() async {
  List<collector> list = [];
  final response = await http.get(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/getCollector.php'),
    headers: {"Content-Type": "application/json"},
  );
  print(response.statusCode);
  print(response.body);
  List<dynamic> res = jsonDecode(response.body);
  if (response.statusCode == 200) {
    for (Map<String, dynamic> i in res) {
      list.add(collector.fromJson(i));
    }
  }
  return list;
}
