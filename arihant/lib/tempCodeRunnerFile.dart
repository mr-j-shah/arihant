Future<void> verifyotp() async {
  final response = await http.post(
    Uri.parse('http://bhimshaktivicharmanch.com/arihant/getclient.php'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(
      <String, dynamic>{'email': 'shahjinay02@gmail.co'},
    ),
  );
  print(response.statusCode);
  print(response.body);
  if (response.statusCode == 200) {
    print("Success");
  } else {
    print("Fail");
  }
}