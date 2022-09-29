// To parse this JSON data, do
//
//     final document = documentFromMap(jsonString);

import 'dart:convert';

class Document {
  Document({
    required this.avaliable,
    required this.name,
    required this.picture,
    required this.price,
  });

  bool avaliable;
  String name;
  String? picture;
  double price;

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        avaliable: json["avaliable"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "avaliable": avaliable,
        "name": name,
        "picture": picture,
        "price": price,
      };
}
