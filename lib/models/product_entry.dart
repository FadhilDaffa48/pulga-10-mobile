// To parse this JSON data, do
//
//     final newsEntry = newsEntryFromJson(jsonString);

import 'dart:convert';

List<NewsEntry> newsEntryFromJson(String str) => List<NewsEntry>.from(json.decode(str).map((x) => NewsEntry.fromJson(x)));

String newsEntryToJson(List<NewsEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsEntry {
  String id;
  String name;
  String description;
  String category;
  int price;
  String thumbnail;
  int sold;
  bool isHot;
  String username;
  bool isOwner;

  NewsEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    required this.sold,
    required this.isHot,
    required this.username,
    required this.isOwner,
  });

  factory NewsEntry.fromJson(Map<String, dynamic> json) => NewsEntry(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    category: json["category"],
    price: json["price"],
    thumbnail: json["thumbnail"],
    sold: json["sold"],
    isHot: json["is_hot"],
    username: json["username"],
    isOwner: json["is_owner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "category": category,
    "price": price,
    "thumbnail": thumbnail,
    "sold": sold,
    "is_hot": isHot,
    "username": username,
    "is_owner": isOwner,
  };
}
