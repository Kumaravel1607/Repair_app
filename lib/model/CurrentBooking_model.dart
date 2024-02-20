// To parse this JSON data, do
//
//     final currentBooking = currentBookingFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CurrentBooking> currentBookingFromJson(String str) =>
    List<CurrentBooking>.from(
        json.decode(str).map((x) => CurrentBooking.fromJson(x)));

String currentBookingToJson(List<CurrentBooking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentBooking {
  final int id;
  final String bookingNo;
  final String address;
  final String serviceId;
  final String paymentType;
  final String userId;
  final DateTime bookingDate;
  final String bookingTime;
  final String totalAmount;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int bookingId;
  final String categoryId;
  final String subcategoryId;
  final String serviceImage;
  final String serviceName;
  final String brand;
  final String model;
  final String servicePrice;
  final String statusText;

  CurrentBooking({
    required this.id,
    required this.bookingNo,
    required this.address,
    required this.serviceId,
    required this.paymentType,
    required this.userId,
    required this.bookingDate,
    required this.bookingTime,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingId,
    required this.categoryId,
    required this.subcategoryId,
    required this.serviceImage,
    required this.serviceName,
    required this.brand,
    required this.model,
    required this.servicePrice,
    required this.statusText,
  });

  factory CurrentBooking.fromJson(Map<String, dynamic> json) => CurrentBooking(
        id: json["id"],
        bookingNo: json["booking_no"],
        address: json["address"],
        serviceId: json["service_id"],
        paymentType: json["payment_type"],
        userId: json["user_id"],
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingTime: json["booking_time"],
        totalAmount: json["total_amount"].toString(),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bookingId: json["booking_id"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        serviceImage: json["service_image"],
        serviceName: json["service_name"],
        brand: json["brand"],
        model: json["model"],
        servicePrice: json["service_price"].toString(),
        statusText: json["status_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_no": bookingNo,
        "address": address,
        "service_id": serviceId,
        "payment_type": paymentType,
        "user_id": userId,
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_time": bookingTime,
        "total_amount": totalAmount,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "booking_id": bookingId,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "service_image": serviceImage,
        "service_name": serviceName,
        "brand": brand,
        "model": model,
        "service_price": servicePrice,
        "status_text": statusText,
      };
}
