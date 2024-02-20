// To parse this JSON data, do
//
//     final modellist = modellistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Modellist> modellistFromJson(String str) =>
    List<Modellist>.from(json.decode(str).map((x) => Modellist.fromJson(x)));

String modellistToJson(List<Modellist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modellist {
  final int id;
  final int categoryId;
  final String brandId;
  final String model;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Modellist({
    required this.id,
    required this.categoryId,
    required this.brandId,
    required this.model,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Modellist.fromJson(Map<String, dynamic> json) => Modellist(
        id: json["id"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        model: json["model"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "brand_id": brandId,
        "model": model,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
