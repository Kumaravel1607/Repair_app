import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Services/MyService.dart';
import 'package:repair/cat.dart';
import 'package:repair/Services/modelselect.dart';
import 'package:repair/model/servicetype_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ServiceList extends StatefulWidget {
  final int screen_no;
  ServiceList({Key? key, required this.screen_no}) : super(key: key);

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  Future<List<ServiceType>> fetchSubCat() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List<ServiceType> list = [];

    var category_id = widget.screen_no;
    Map data = {'category_id': category_id.toString()};
    print('-----xxx----');
    // print(data);
    var url = Service_Type;
    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = ServiceTypeResponse(jsonEncode(responseBody['result']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<ServiceType> ServiceTypeResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ServiceType>((json) => ServiceType.fromJson(json))
        .toList();
  }

  List<ServiceType> list = [];
  bool isLoading = true;
  _servicetype() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    print("--------");
    // print(email);
    fetchSubCat().then((results) {
      setState(() {
        isLoading = false;
        list = results;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _servicetype();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),

          Container(
            // height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final listdata = list[index];
                  return _card(
                      listdata.subcategoryName,
                      listdata.subcategoryImage,
                      //  'Oil Services',
                      // 'assets/images/Oils.png',
                      Catolist(subcategory_id: listdata.id));
                }),
          ),
          // _card('Oil Services', 'assets/images/Oils.png', Catolist()),
          // SizedBox(
          //   height: 10,
          // ),
          // _card('Engine Services', 'assets/images/ser.jpg', Catolist()),
          // SizedBox(
          //   height: 10,
          // ),
          // _card('Denting & Painting', 'assets/images/dent.jpg', Catolist()),
          // SizedBox(
          //   height: 10,
          // ),
          // _card(
          //     'Clutch Services', 'assets/images/clutchser.jpg', Catolist()),
          // SizedBox(
          //   height: 10,
          // ),
          // _card('Periodic Services', 'assets/images/periodic.jpg',
          //     Catolist()),

          // _card('LOGOUT', Icons.chevron_right, logOut()),
        ],
      ),
    );
  }

  _card(String text, image, go_screen) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => go_screen));
      },
      child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: black),
                ),
              ],
            ),
          )),
    );
  }
}
