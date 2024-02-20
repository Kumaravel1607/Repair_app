// To parse this JSON data, do
//
//     final quickServiceList = quickServiceListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<QuickServiceList> quickServiceListFromJson(String str) =>
    List<QuickServiceList>.from(
        json.decode(str).map((x) => QuickServiceList.fromJson(x)));

String quickServiceListToJson(List<QuickServiceList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuickServiceList {
  final int id;
  final int categoryId;
  final int subcategoryId;
  final String serviceImage;
  final dynamic featuredImage;
  final String serviceName;
  final String serviceRecommended;
  final String serviceWarranty;
  final String serviceTime;
  final String serviceCurrency;
  final int servicePrice;
  final int pickupPrice;
  final String description;
  final String serviceSlug;
  final String popularService;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String subcategoryName;
  final String categoryName;

  QuickServiceList({
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
    required this.subcategoryName,
    required this.categoryName,
  });

  factory QuickServiceList.fromJson(Map<String, dynamic> json) =>
      QuickServiceList(
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
        subcategoryName: json["subcategory_name"],
        categoryName: json["category_name"],
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
        "service_price": servicePrice.toString(),
        "pickup_price": pickupPrice.toString(),
        "description": description,
        "service_slug": serviceSlug,
        "Popular_service": popularService,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subcategory_name": subcategoryName,
        "category_name": categoryName,
      };
}
