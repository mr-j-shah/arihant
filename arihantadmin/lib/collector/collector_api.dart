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
    return user;
  }

  collector.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        image = json["image"],
        address = json["address"],
        mobile = json["mobile"];
}
