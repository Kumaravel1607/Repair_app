import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Services/ServiceAddress.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/cat.dart';
import 'package:repair/Services/modelselect.dart';
import 'package:repair/model/popularservice_model.dart';
import 'package:repair/model/subcategory_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class Category extends StatefulWidget {
  final int screen;
  Category({Key? key, required this.screen}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController _textEditingController = TextEditingController();
  int selectedIndex = 0;
  List CatNames = [
    'Oil Services',
    'Engine',
    'Clutch',
    'View more',
  ];
  List<Color> CatColor = [
    Color(0xFF4075ff),
    Color(0xFFff5b83),
    Color(0xFF70D4FF),
    Color(0xFFFF8024),
    Color(0xFF9540FF)
  ];

  List<Image> CatImages = [
    Image(
      image: AssetImage(
        'assets/images/oil.png',
      ),
      width: 50,
      height: 50,
    ),
    Image(
      image: AssetImage('assets/images/engine.png'),
      width: 50,
      height: 50,
    ),
    Image(
      image: AssetImage('assets/images/spare-tire.png'),
      width: 50,
      height: 50,
    ),
    Image(
      image: AssetImage('assets/images/repair.png'),
      width: 50,
      height: 50,
    ),
    // Image(
    //   image: AssetImage(
    //     'assets/images/train.png',
    //   ),
    //   color: white,
    //   width: 30,
    //   height: 30,
    // ),
  ];

  String _image = '';
  String _title = '';
  String _subtitle = '';
  String _des = '';

  void initState() {
    // TODO: implement initState
    super.initState();
    home();
    _quicklist();
    _sublist();
  }

  // String _statustext = '';
  home() async {
    var url = banner_list;
    var data = {'category_id': widget.screen.toString()};
    var body = json.encode(data);
    var urlparse = Uri.parse(url);
    Response response = await http.post(
      urlparse,
      body: data,
    );
    var response_data = json.decode(response.body);
    print(response_data);
    if (response.statusCode == 200) {
      setState(() {
        _image = (response_data['result']['banner_image'].toString());
        _title = (response_data['result']['banner_title'].toString());
        _subtitle = (response_data['result']['banner_subtitle'].toString());
        _des = (response_data['result']['banner_shortdescription'].toString());

        print(_image);
      });
      return;

      // print(_pending);
      // print(_approved);
      // print(_reject);
      // print(_total);
      // print(user_name);
      // print(section);
      // print('Sucessfull');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response_data['message'].toString()),
        backgroundColor: Blue.withOpacity(0.6),
      ));
    }
  }

  Future<List<QuickServiceList>> quickservice() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    List<QuickServiceList> users = [];
    var category_id = widget.screen;
    Map data = {'category_id': category_id.toString()};
    print('-----xxx----');
    // print(data);
    var url = popularservice_list;

    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      users = QuickServiceListResponse(jsonEncode(responseBody['result']));

      // print(list);
      return users;
    } else {
      print(response.statusCode);
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<QuickServiceList> QuickServiceListResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<QuickServiceList>((json) => QuickServiceList.fromJson(json))
        .toList();
  }

  List<QuickServiceList> users = [];
  bool isloading = true;
  _quicklist() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    print("--------");
    // print(email);
    quickservice().then((results) {
      setState(() {
        isloading = false;
        users = results;
      });
    });
  }

  Future<List<SubCatList>> fetchSubCat() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List<SubCatList> list = [];
    String ser_id;

    var category_id = widget.screen;
    Map data = {'category_id': category_id.toString()};
    print('-----xxx----');
    // print(data);
    var url = SubCategory_list;
    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = SubCatResponse(jsonEncode(responseBody['result']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<SubCatList> SubCatResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SubCatList>((json) => SubCatList.fromJson(json)).toList();
  }

  List<SubCatList> list = [];
  bool isLoading = true;
  _sublist() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    print("--------");
    // print(email);
    fetchSubCat().then((results) {
      setState(() {
        isloading = false;
        list = results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        _image,
                      ),

                      // image: AssetImage(
                      //   'assets/images/car02.jpeg',
                      // ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.all(3),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(5),

                //     // child: Image.network(
                //     //   _image,
                //     //   fit: BoxFit.fill,
                //     //   height: 150,
                //     //   width: double.infinity,
                //     // ),
                //     child: Image.asset(
                //       // _image,
                //       'assets/images/car02.jpeg',
                //       fit: BoxFit.fill,
                //       height: 150,
                //       width: double.infinity,
                //     ),
                //   ),
                // ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Text(
                    _title,
                    // 'More Shine,',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: Text(
                    _subtitle,
                    //  'More Production',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: white),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Text(
                    _des,
                    // 'Get more offers %',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final listdata = list[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectedIndex = index;
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                                    builder: (context) => Catolist(
                                          subcategory_id:
                                              listdata.id.toString(),
                                        )));
                            // if (CatNames[selectedIndex] == "Flight") {
                            //   Navigator.of(context, rootNavigator: true)
                            //       .push(MaterialPageRoute(
                            //           builder: (context) => Flight(
                            //                 categoryname: CatNames[index],
                            //               )));
                            // } else if (CatNames[selectedIndex] == "Hotel") {
                            //   Navigator.of(context, rootNavigator: true)
                            //       .push(MaterialPageRoute(
                            //           builder: (context) => Hotel(
                            //                 categoryname: CatNames[index],
                            //               )));
                            // } else if (CatNames[selectedIndex] == "Car") {
                            //   Navigator.of(context, rootNavigator: true)
                            //       .push(MaterialPageRoute(
                            //           builder: (context) => Cars(
                            //                 categoryname: CatNames[index],
                            //               )));
                            // }
                            // Navigator.of(context, rootNavigator: true).push(
                            //   MaterialPageRoute(
                            //       builder: (context) => Flight(
                            //             categoryname: CatNames[index],
                            //           )),
                            //Cars()
                            //)
                            // Hotel(
                            //       categoryname: CatNames[index],
                            //     )),
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(int.parse(listdata.color)),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: grey,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 4)),
                              ],
                            ),
                            child: Center(
                              child:
                                  //CatImages[index],
                                  Image(
                                image: NetworkImage(listdata.subcategoryLogo
                                    // 'assets/images/oil.png',
                                    ),
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          listdata.subcategoryName,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Fast Services',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = users[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => ModelSelect(
                                      ser_id: list[index].id.toString())));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 0),
                          child: SizedBox(
                            height: 125,
                            child: Card(
                              color: Color.fromARGB(255, 248, 252, 253),
                              elevation: 3,
                              // color: yellow,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(item.serviceImage),

                                          // image: AssetImage(
                                          //   'assets/images/car02.jpeg',
                                          // ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.serviceName,
                                              //'Quick Service',
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    item.description,
                                                    //'Fix your car from the Top to Bottom  with our Specialists',
                                                    maxLines: 2,
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: tab,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons.chevron_right_sharp,
                                                      size: 35,
                                                    )),
                                              ],
                                            ),
                                            Text(
                                              "Starts From ₹" +
                                                  item.servicePrice.toString(),
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
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
      ),
    );
  }
}
