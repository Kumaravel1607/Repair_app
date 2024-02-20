// To parse this JSON data, do
//
//     final brandlist = brandlistFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<List<Brandlist>> brandlistFromJson(String str) =>
    List<List<Brandlist>>.from(json
        .decode(str)
        .map((x) => List<Brandlist>.from(x.map((x) => Brandlist.fromJson(x)))));

String brandlistToJson(List<List<Brandlist>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class Brandlist {
  final int id;
  final String brandName;
  final int categoryId;

  Brandlist({
    required this.id,
    required this.brandName,
    required this.categoryId,
  });

  factory Brandlist.fromJson(Map<String, dynamic> json) => Brandlist(
        id: json["id"],
        brandName: json["brand_name"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand_name": brandName,
        "category_id": categoryId,
      };
}
