// To parse this JSON data, do
//
//     final faq = faqFromJson(jsonString);

import 'dart:convert';

List<Faq> faqFromJson(String str) =>
    List<Faq>.from(json.decode(str).map((x) => Faq.fromJson(x)));

String faqToJson(List<Faq> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Faq {
  final int id;
  final String faqTitle;
  final String faqDescription;
  final String status;
  String createdAt;
  String updatedAt;

  Faq({
    required this.id,
    required this.faqTitle,
    required this.faqDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        id: json["id"],
        faqTitle: json["faq_title"] != null ? json["faq_title"] : '',
        faqDescription:
            json["faq_description"] != null ? json["faq_description"] : '',
        status: json["status"] != null ? json["status"] : '',
        createdAt: json["created_at"] != null ? json["created_at"] : '',
        updatedAt: json["updated_at"] != null ? json["updated_at"] : '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "faq_title": faqTitle,
        "faq_description": faqDescription,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
