// To parse this JSON data, do
//
//     final document = documentFromMap(jsonString);

import 'dart:convert';

class Document {
  Document({
    required this.available,
    required this.name,
    picture,
    id,
    required this.price,
  });

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Document copy() => Document(
        available: available,
        name: name,
        picture: picture,
        price: price,
        id: id,
      );
}
