import 'dart:convert';

import 'package:repair/Api/Api.dart';
import 'package:repair/model/Category_model.dart';

import 'package:repair/model/FAQ_model.dart';
import 'package:repair/model/banner_model.dart';
import 'package:repair/model/brand_model.dart';
import 'package:repair/model/popularservice_model.dart';
import 'package:repair/model/subcategory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static Future<List<Faq>> faqdata() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<Faq> users = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = faq;

    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      users = FaqResponse(jsonEncode(responseBody['result']));

      // print(list);
      return users;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<Faq> FaqResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Faq>((json) => Faq.fromJson(json)).toList();
  }

  static Future<List<CatData>> fetchCat() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List<CatData> list = [];

    Map data = {};
    print('-----xxx----');
    // print(data);
    var url = Category_list;
    var urlparse = Uri.parse(url);

    final response = await http.post(
      urlparse,
    );
    print(urlparse);

    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = CatDataResponse(jsonEncode(responseBody['data']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<CatData> CatDataResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CatData>((json) => CatData.fromJson(json)).toList();
  }
}
