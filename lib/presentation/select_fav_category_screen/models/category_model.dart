import 'dart:convert';

List<Category> articleFromJson(String str) => List<Category>.from(json
    .decode(str)['category']
    .map((x) => Category.fromJson(Map<String, dynamic>.from(x))));

class Category {
  int? id;
  String? icon;
  String? category;

  Category({this.id, this.icon, this.category});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json["id"], icon: json["icon"], category: json["category"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "icon": icon, "category": category};
}
