import 'dart:convert';

Singleanimal singleanimalFromJson(String str) => Singleanimal.fromJson(json.decode(str));

String singleanimalToJson(Singleanimal data) => json.encode(data.toJson());

class Singleanimal {
  Singleanimal({
    this.status,
    this.image,
    this.title,
    this.subTitle,
    this.months,
    this.length,
    this.gender,
    this.color,
    this.distance,
    this.description,
  });

  bool status;
  String image;
  String title;
  String subTitle;
  int months;
  int length;
  String gender;
  String color;
  int distance;
  String description;

  factory Singleanimal.fromJson(Map<String, dynamic> json) => Singleanimal(
    status: json["status"],
    image: json["image"],
    title: json["title"],
    subTitle: json["sub_title"],
    months: json["months"],
    length: json["length"],
    gender: json["gender"],
    color: json["color"],
    distance: json["distance"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "image": image,
    "title": title,
    "sub_title": subTitle,
    "months": months,
    "length": length,
    "gender": gender,
    "color": color,
    "distance": distance,
    "description": description,
  };
}
