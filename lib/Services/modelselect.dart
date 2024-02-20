import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Services/ServiceAddress.dart';
import 'package:repair/model/Modellist_model.dart';
import 'package:repair/model/brand_model.dart';
import 'package:repair/model/brand_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ModelSelect extends StatefulWidget {
  final String ser_id;
  ModelSelect({Key? key, required this.ser_id}) : super(key: key);

  @override
  State<ModelSelect> createState() => _ModelSelectState();
}

class _ModelSelectState extends State<ModelSelect> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getbrand();
    fetchbrand();
    //fetchmodel();
  }

  String? _chosenbrand;
  String? _chosenmodel;
  // List Brand = [];
  // List Gender = [];
  bool _isLoading = false;
  // Future<dynamic> getbrand() async {
  //   SharedPreferences session = await SharedPreferences.getInstance();
  //   var Service_id = widget.ser_id.toString();
  //   var url = vechilebrand;

  //   var urlparse = Uri.parse(url);
  //   Map data = {"service_id": Service_id};

  //   Response res = await http.post(
  //     urlparse,
  //     body: data,
  //   );
  //   if (res.statusCode == 200) {
  //     var resBody = (json.decode(res.body));

  //     print(resBody);
  //     setState(() {
  //       _isLoading = true;
  //       Brand = resBody[['brand_name']];
  //       print(Brand);
  //     });

  //     return "Success";
  //   } else {
  //     _isLoading = false;
  //     print("error");
  //     print(res.body.toString());
  //   }
  // }

  Future<List<Brandlist>> getbrand() async {
    var Service_id = widget.ser_id.toString();
    var url = vechilebrand;

    Map data = {"service_id": Service_id};

    var urlparse = Uri.parse(url);
    final response = await http.post(urlparse, body: data);
    print(urlparse);
    List<Brandlist> list = [];
    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = BrandlistResponse(jsonEncode(responseBody['result']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<Brandlist> BrandlistResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Brandlist>((json) => Brandlist.fromJson(json)).toList();
  }

  late List<Brandlist> Brand_list = [];
  //  late List<Datum> users = [];

  fetchbrand() async {
    getbrand().then((results) {
      setState(() {
        Brand_list = results;
      });
    });
  }

  Future<List<Modellist>> getmodel(_choosebrand) async {
    var brand_id = _chosenbrand.toString();
    var url = vechilemodel;

    Map data = {"brand_id": brand_id};
    print(data);

    var urlparse = Uri.parse(url);
    final response = await http.post(urlparse, body: data);
    print(urlparse);
    List<Modellist> list = [];
    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = ModellistResponse(jsonEncode(responseBody['result']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<Modellist> ModellistResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Modellist>((json) => Modellist.fromJson(json)).toList();
  }

  late List<Modellist> Model_list = [];
  //  late List<Datum> users = [];

  fetchmodel() async {
    getmodel(_chosenbrand).then((results) {
      setState(() {
        Model_list = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            )),
        titleSpacing: 0,
        title: Text(
          'Select Our Model',
          style: TextStyle(
              color: black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Brand',
                  style: TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 14, right: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: box),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Select Brand',
                      // hintText: 'Date-Month-Year',

                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      focusedErrorBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: const BorderRadius.all(
                    //     const Radius.circular(10),
                    //   ),
                    // ),
                    //               ),
                    // decoration: InputDecoration(
                    //   enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.grey, width: 1), //<-- SEE HERE
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.black, width: 2), //<-- SEE HERE
                    //   ),
                    //   filled: true,
                    //   // fillColor: Colors.greenAccent,
                    // ),

                    //dropdownColor: greylite,
                    // value: _chosenbrand,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        _chosenbrand = value;
                        print('Id:' + _chosenbrand.toString());
                      });
                      fetchmodel();
                    },
                    // validator: (value) =>
                    //     value == null ? 'Select Vechile_Brand' : null,

                    value: _chosenbrand == "" || _chosenbrand == null
                        ? null
                        : _chosenbrand.toString(),
                    validator: (value) {
                      if (required == 1) {
                        print(value);
                        if (value == "" || value == null) {
                          return 'This field is requrired';
                        }
                        return null;
                      } else {
                        return null;
                      }
                    },
                    // items: <String>[
                    //   'Audi',
                    //   'BMW'
                    //       'Toyota',
                    //   'Hyndai',
                    //   'Nissan',
                    //   'TATA'
                    // ].map<DropdownMenuItem<String>>((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(
                    //       value,
                    //       style: TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.w500),
                    //     ),
                    //   );
                    // }).toList(),
                    items: Brand_list.map((List) {
                      return DropdownMenuItem<String>(
                          child: Text(List.brandName),
                          value: List.id.toString());
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Select Model',
                  style: TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 14, right: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: box),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Select Model',
                      // hintText: 'Date-Month-Year',

                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      focusedErrorBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: const BorderRadius.all(
                    //     const Radius.circular(10),
                    //   ),
                    // ),
                    //               ),
                    // decoration: InputDecoration(
                    //   enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.grey, width: 1), //<-- SEE HERE
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.black, width: 2), //<-- SEE HERE
                    //   ),
                    //   filled: true,
                    //   // fillColor: Colors.greenAccent,
                    // ),

                    //dropdownColor: greylite,
                    //value: _chosenmodel,
                    value: _chosenmodel == "" || _chosenmodel == null
                        ? null
                        : _chosenmodel.toString(),
                    validator: (value) {
                      if (required == 1) {
                        print(value);
                        if (value == "" || value == null) {
                          return 'This field is requrired';
                        }
                        return null;
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        _chosenmodel = value;
                      });
                    },
                    items: Model_list.map((List) {
                      return DropdownMenuItem<String>(
                          child: Text(List.model), value: List.id.toString());
                    }).toList(),
                    // items: <String>['Audi A4', '7 SUVs', 'e-tron GT']
                    //     .map<DropdownMenuItem<String>>((String value) {
                    //   return DropdownMenuItem<String>(
                    //     value: value,
                    //     child: Text(
                    //       value,
                    //       style: TextStyle(
                    //           fontSize: 14, fontWeight: FontWeight.w500),
                    //     ),
                    //   );
                    // }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      // side: const BorderSide(
                      //   width: 2,
                      //   color: Blue,
                      // ),
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: orange,
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => ServiceAddress()));
                },
                child: Text(
                  'Proceed',
                  style: TextStyle(
                      color: white, fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
