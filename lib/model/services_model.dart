// To parse this JSON data, do
//
//     final serviceAdd = serviceAddFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ServiceAdd> serviceAddFromJson(String str) =>
    List<ServiceAdd>.from(json.decode(str).map((x) => ServiceAdd.fromJson(x)));

String serviceAddToJson(List<ServiceAdd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceAdd {
  final int id;
  final int categoryId;
  final int subcategoryId;
  final String serviceName;
  final String serviceCurrency;
  final int servicePrice;
  final int offerPrice;
  final String appDesc1;
  final String appDesc2;
  final String appDesc3;
  final String appDesc4;
  final String serviceImage;
  final String subcategoryName;

  ServiceAdd({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.serviceName,
    required this.serviceCurrency,
    required this.servicePrice,
    required this.offerPrice,
    required this.appDesc1,
    required this.appDesc2,
    required this.appDesc3,
    required this.appDesc4,
    required this.serviceImage,
    required this.subcategoryName,
  });

  factory ServiceAdd.fromJson(Map<String, dynamic> json) => ServiceAdd(
        id: json["id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        serviceName: json["service_name"],
        serviceCurrency: json["service_currency"],
        servicePrice: json["service_price"],
        offerPrice: json["offer_price"],
        appDesc1: json["app_desc1"],
        appDesc2: json["app_desc2"],
        appDesc3: json["app_desc3"],
        appDesc4: json["app_desc4"],
        serviceImage: json["service_image"],
        subcategoryName: json["subcategory_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "service_name": serviceName,
        "service_currency": serviceCurrency,
        "service_price": servicePrice,
        "offer_price": offerPrice,
        "app_desc1": appDesc1,
        "app_desc2": appDesc2,
        "app_desc3": appDesc3,
        "app_desc4": appDesc4,
        "service_image": serviceImage,
        "subcategory_name": subcategoryName,
      };
}
