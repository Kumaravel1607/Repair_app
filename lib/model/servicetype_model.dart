// To parse this JSON data, do
//
//     final serviceType = serviceTypeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ServiceType> serviceTypeFromJson(String str) => List<ServiceType>.from(
    json.decode(str).map((x) => ServiceType.fromJson(x)));

String serviceTypeToJson(List<ServiceType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceType {
  final String id;
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

  ServiceType({
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

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"].toString(),
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
        "id": id.toString(),
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
