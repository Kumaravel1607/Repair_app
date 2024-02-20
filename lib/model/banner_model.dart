// To parse this JSON data, do
//
//     final bannerList = bannerListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BannerList> bannerListFromJson(String str) =>
    List<BannerList>.from(json.decode(str).map((x) => BannerList.fromJson(x)));

String bannerListToJson(List<BannerList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerList {
  final int id;
  final String categoryId;
  final String bannerImage;
  final String bannerTitle;
  final String bannerSubtitle;
  final String bannerShortdescription;
  final String bannerDescription;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String categoryName;

  BannerList({
    required this.id,
    required this.categoryId,
    required this.bannerImage,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.bannerShortdescription,
    required this.bannerDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryName,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        id: json["id"],
        categoryId: json["category_id"],
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
        bannerSubtitle: json["banner_subtitle"],
        bannerShortdescription: json["banner_shortdescription"],
        bannerDescription: json["banner_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "banner_image": bannerImage,
        "banner_title": bannerTitle,
        "banner_subtitle": bannerSubtitle,
        "banner_shortdescription": bannerShortdescription,
        "banner_description": bannerDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category_name": categoryName,
      };
}
