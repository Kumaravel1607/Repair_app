// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CatData> categoryFromJson(String str) =>
    List<CatData>.from(json.decode(str).map((x) => CatData.fromJson(x)));

String categoryToJson(List<CatData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatData {
  final int id;
  final String categoryName;
  final String categorySlug;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  CatData({
    required this.id,
    required this.categoryName,
    required this.categorySlug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CatData.fromJson(Map<String, dynamic> json) => CatData(
        id: json["id"],
        categoryName: json["category_name"],
        categorySlug: json["category_slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "category_slug": categorySlug,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
