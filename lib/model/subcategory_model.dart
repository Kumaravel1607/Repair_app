// To parse this JSON data, do
//
//     final subCatList = subCatListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SubCatList> subCatListFromJson(String str) =>
    List<SubCatList>.from(json.decode(str).map((x) => SubCatList.fromJson(x)));

String subCatListToJson(List<SubCatList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCatList {
  final int id;
  final String categoryId;
  final String subcategoryName;
  final String subcategoryImage;
  final String subcategoryLogo;
  final String color;
  final String subcategorySlug;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String categoryName;

  SubCatList({
    required this.id,
    required this.categoryId,
    required this.subcategoryName,
    required this.subcategoryImage,
    required this.subcategoryLogo,
    required this.color,
    required this.subcategorySlug,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
  });

  factory SubCatList.fromJson(Map<String, dynamic> json) => SubCatList(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryName: json["subcategory_name"],
        subcategoryImage: json["subcategory_image"],
        subcategoryLogo: json["subcategory_logo"],
        color: json["color"],
        subcategorySlug: json["subcategory_slug"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_name": subcategoryName,
        "subcategory_image": subcategoryImage,
        "subcategory_logo": subcategoryLogo,
        "color": color,
        "subcategory_slug": subcategorySlug,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_name": categoryName,
      };
}
