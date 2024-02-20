import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Services/modelselect.dart';
import 'package:repair/model/services_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Catolist extends StatefulWidget {
  final String subcategory_id;
  Catolist({Key? key, required this.subcategory_id}) : super(key: key);

  @override
  State<Catolist> createState() => _CatolistState();
}

class _CatolistState extends State<Catolist> {
  Future<List<ServiceAdd>> fetchAdd() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    // var subcategory_id = session.getString('subcategory_id');
    List<ServiceAdd> list = [];

    Map data = {'subcategory_id': widget.subcategory_id.toString()};
    print('-----xxx----');
    // print(data);
    var url = Service_add;
    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = ServiceAddlistResponse(jsonEncode(responseBody['result']));

      // print(list);

      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<ServiceAdd> ServiceAddlistResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ServiceAdd>((json) => ServiceAdd.fromJson(json)).toList();
  }

  List<ServiceAdd> list = [];
  bool isLoading = true;
  _serviceadd() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    print("--------");
    // print(email);
    fetchAdd().then((results) {
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
    _serviceadd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: white,
        titleSpacing: 5,
        title: Text(
          'Add on Service',
          style: TextStyle(
              color: black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please Select Your Perferred Service To Add',
                        style: TextStyle(
                            color: dash,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                          child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: ScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (BuildContext context, int index) {
                              final add = list[index];
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ModelSelect(
                                                  ser_id:
                                                      list[index].id.toString(),
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 0),
                                    child: SizedBox(
                                      // height: 210,
                                      child: Card(
                                        elevation: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                add.serviceName,
                                                // 'Oil Service',
                                                style: TextStyle(
                                                    color: black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        '- ' + add.appDesc1,
                                                        textAlign:
                                                            TextAlign.justify,
                                                        overflow: TextOverflow
                                                            .ellipsis,

                                                        // softWrap: true,
                                                        maxLines: 2,
                                                        // '- Check Engine oil',
                                                        style: TextStyle(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '- ' + add.appDesc2,
                                                        // '- Check clutch box',
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '- ' + add.appDesc3,
                                                        // '- Cleans top to bottom',
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        '- ' + add.appDesc4,
                                                        //'- Apply anti pest',
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '₹' +
                                                            add.servicePrice
                                                                .toString(),
                                                        //  '₹920',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      Text(
                                                        '₹' +
                                                            add.offerPrice
                                                                .toString(),
                                                        // '₹520',
                                                        style: TextStyle(
                                                            color: black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    fit: StackFit.passthrough,
                                                    children: [
                                                      SizedBox(
                                                        //height: 120,
                                                        child: Container(
                                                          // height: 100,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            child:
                                                                Image.network(
                                                              add.serviceImage,
                                                              // 'assets/images/tank.png',
                                                              fit: BoxFit.fill,
                                                              height: 100,
                                                              width: 100,
                                                            ),
                                                          ),
                                                        ),
                                                        //     Container(
                                                        //   decoration:
                                                        //       BoxDecoration(
                                                        //           borderRadius:
                                                        //               BorderRadius
                                                        //                   .circular(
                                                        //                       5),
                                                        //           image: DecorationImage(
                                                        //               image: NetworkImage(
                                                        //                 add.serviceImage,

                                                        //               ),
                                                        //               fit: BoxFit.cover)),
                                                        // ),
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      // Positioned(
                                                      //   bottom: -6,
                                                      //   child: ElevatedButton(
                                                      //     style: ButtonStyle(
                                                      //       backgroundColor:
                                                      //           MaterialStateProperty
                                                      //               .all(
                                                      //                   orange),
                                                      //     ),
                                                      //     onPressed: () {},
                                                      //     child: Text(
                                                      //       'ADD',
                                                      //       style: TextStyle(
                                                      //           color: white,
                                                      //           fontSize: 12,
                                                      //           fontWeight:
                                                      //               FontWeight
                                                      //                   .w800),
                                                      //     ),
                                                      //   ),
                                                      // )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
