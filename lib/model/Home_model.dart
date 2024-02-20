// To parse this JSON data, do
//
//     final homePage = homePageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<List<dynamic>> homePageFromJson(String str) => List<List<dynamic>>.from(
    json.decode(str).map((x) => List<dynamic>.from(x.map((x) => x))));

String homePageToJson(List<List<dynamic>> data) => json.encode(
    List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))));

class HomePageElement {
  final int id;
  final dynamic categoryId;
  final int subcategoryId;
  final String serviceImage;
  final dynamic featuredImage;
  final String serviceName;
  final String serviceRecommended;
  final String serviceWarranty;
  final String serviceTime;
  final String serviceCurrency;
  final String servicePrice;
  final String pickupPrice;
  final String description;
  final String serviceSlug;
  final String popularService;
  final dynamic status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String bannerImage;
  final String bannerTitle;
  final String bannerSubtitle;
  final String bannerShortdescription;
  final String bannerDescription;
  final String categoryName;
  final String categorySlug;
  final String subcategoryName;
  final String subcategorySlug;

  HomePageElement({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.serviceImage,
    required this.featuredImage,
    required this.serviceName,
    required this.serviceRecommended,
    required this.serviceWarranty,
    required this.serviceTime,
    required this.serviceCurrency,
    required this.servicePrice,
    required this.pickupPrice,
    required this.description,
    required this.serviceSlug,
    required this.popularService,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.bannerImage,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.bannerShortdescription,
    required this.bannerDescription,
    required this.categoryName,
    required this.categorySlug,
    required this.subcategoryName,
    required this.subcategorySlug,
  });

  factory HomePageElement.fromJson(Map<String, dynamic> json) =>
      HomePageElement(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        serviceImage: json["service_image"],
        featuredImage: json["featured_image"],
        serviceName: json["service_name"],
        serviceRecommended: json["service_recommended"],
        serviceWarranty: json["service_warranty"],
        serviceTime: json["service_time"],
        serviceCurrency: json["service_currency"],
        servicePrice: json["service_price"],
        pickupPrice: json["pickup_price"],
        description: json["description"],
        serviceSlug: json["service_slug"],
        popularService: json["Popular_service"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bannerImage: json["banner_image"],
        bannerTitle: json["banner_title"],
        bannerSubtitle: json["banner_subtitle"],
        bannerShortdescription: json["banner_shortdescription"],
        bannerDescription: json["banner_description"],
        categoryName: json["category_name"],
        categorySlug: json["category_slug"],
        subcategoryName: json["subcategory_name"],
        subcategorySlug: json["subcategory_slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "service_image": serviceImage,
        "featured_image": featuredImage,
        "service_name": serviceName,
        "service_recommended": serviceRecommended,
        "service_warranty": serviceWarranty,
        "service_time": serviceTime,
        "service_currency": serviceCurrency,
        "service_price": servicePrice,
        "pickup_price": pickupPrice,
        "description": description,
        "service_slug": serviceSlug,
        "Popular_service": popularService,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "banner_image": bannerImage,
        "banner_title": bannerTitle,
        "banner_subtitle": bannerSubtitle,
        "banner_shortdescription": bannerShortdescription,
        "banner_description": bannerDescription,
        "category_name": categoryName,
        "category_slug": categorySlug,
        "subcategory_name": subcategoryName,
        "subcategory_slug": subcategorySlug,
      };
}
