import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/ApiServices/remoteservice.dart';
import 'package:repair/Services/MyService.dart';
import 'package:repair/Services/ServiceAddress.dart';
import 'package:repair/Car/Car.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/SelectService.dart';
import 'package:repair/model/Category_model.dart';
import 'package:repair/model/banner_model.dart';
import 'package:repair/model/popularservice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class Home extends StatefulWidget {
  final String name;
  Home({Key? key, required this.name}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  TextEditingController _textEditingController = TextEditingController();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  // List Tab = [
  //   'Car',
  //   'Bike',
  // ];
  // List<Color> TabColor = [
  //   Color(0xFF4075ff),
  //   Color(0xFFff5b83),
  // ];
  // List<Image> TabImages = [
  //   Image(
  //     image: AssetImage(
  //       'assets/images/car1.png',
  //     ),
  //     width: 50,
  //     height: 50,
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/bike.png'),
  //     width: 50,
  //     height: 50,
  //   ),
  // ];
  // List CatNames = [
  //   'OilServices',
  //   'Engine',
  //   'Clutch',
  //   'View more',
  // ];
  // List<Color> CatColor = [
  //   Color(0xFF4075ff),
  //   Color(0xFFff5b83),
  //   Color(0xFF70D4FF),
  //   Color(0xFFFF8024),
  //   Color(0xFF9540FF)
  // ];

  // List<Image> CatImages = [
  //   Image(
  //     image: AssetImage(
  //       'assets/images/oil.png',
  //     ),
  //     width: 50,
  //     height: 50,
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/engine.png'),
  //     width: 50,
  //     height: 50,
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/spare-tire.png'),
  //     width: 50,
  //     height: 50,
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/repair.png'),
  //     width: 50,
  //     height: 50,
  //   ),
  //   // Image(
  //   //   image: AssetImage(
  //   //     'assets/images/train.png',
  //   //   ),
  //   //   color: white,
  //   //   width: 30,
  //   //   height: 30,
  //   // ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: tab,
          leadingWidth: 100,
          leading: Image.asset(
            'assets/images/logo.png',
            width: 150,
            height: 50,
            fit: BoxFit.cover,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/av.png',
                width: 50,
                height: 20,
              ),
            )
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Icon(Icons.location_pin),
                  //     Text(
                  //       'Location',
                  //       style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600,
                  //           color: black),
                  //     )
                  //   ],
                  // ),

                  Card(
                    color: grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey " + widget.name.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Lets ReStock the Vechile together..!',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            // onChanged: (text) {
                            //   setState(() {
                            //     _keyword = text;
                            //   });
                            // },
                            onChanged: (value) {
                              setState(() {
                                // _search = users
                                // .where((element) => element
                                //     .firstName!
                                //     .toLowerCase()
                                //     .contains(value.toLowerCase()))
                                // .toList();
                              });
                            },

                            // onChanged: (string) {
                            //   _debouncer.run(() {
                            //     setState(() {
                            //       _search = users
                            //           .where(
                            //             (u) => (u.firstName!
                            //                 .toLowerCase()
                            //                 .contains(
                            //                   string.toLowerCase(),
                            //                 )),
                            //           )
                            //           .toList();
                            //     });
                            //   });
                            // },
                            controller: _textEditingController,
                            // onChanged: (value) => _Filter(value),
                            decoration: InputDecoration(
                                fillColor: light,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: grey),
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: const EdgeInsets.only(left: 20),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search for Services',
                                hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    height: 50,
                    child: Card(
                      color: greylite,
                      elevation: 2,
                      // height: 50,
                      child: TabBar(
                        //  indicatorPadding: EdgeInsets.all(10),
                        controller: tabController,
                        indicator: ShapeDecoration(
                            color: orange,
                            //   shape: StadiumBorder(),
                            // ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.all(
                                    new Radius.circular(5)))),
                        // color: Color.fromARGB(255, 109, 179, 236)),
                        // color: Colors.indigo,
                        unselectedLabelColor: black,
                        labelColor: white,
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                        tabs: [
                          Row(children: [
                            Image.asset(
                              'assets/images/car1.png',
                              width: 50,
                              height: 50,
                            ),
                            // Icon(
                            //   Icons.arrow_forward,
                            //   //  color: black,
                            //   // size: 25,
                            // ),
                            SizedBox(width: 15),
                            Text(
                              "Car",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ]),
                          Row(children: [
                            Image.asset(
                              'assets/images/bike.png',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Bike",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ]),
                          // Tab(text: 'Round Trip'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 1.4,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Category(screen: 1),
                        Category(
                          screen: 2,
                        )
                        // Oneway(
                        //   categoryname: widget.categoryname,
                        // ),
                        // Roundtrip(
                        //   categoryname: widget.categoryname,
                        // ),
                        // Multicity(),
                      ],
                    ),
                  ),

                  // Center(
                  //   child: Container(
                  //     height: 100,
                  //     child: ListView.builder(
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: Tab.length,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Column(
                  //             children: [
                  //               GestureDetector(
                  //                 onTap: () {
                  //                   selectedIndex = index;
                  //                   // if (CatNames[selectedIndex] == "Flight") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Flight(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // } else if (CatNames[selectedIndex] == "Hotel") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Hotel(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // } else if (CatNames[selectedIndex] == "Car") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Cars(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // }
                  //                   // Navigator.of(context, rootNavigator: true).push(
                  //                   //   MaterialPageRoute(
                  //                   //       builder: (context) => Flight(
                  //                   //             categoryname: CatNames[index],
                  //                   //           )),
                  //                   //Cars()
                  //                   //)
                  //                   // Hotel(
                  //                   //       categoryname: CatNames[index],
                  //                   //     )),
                  //                   // );
                  //                 },
                  //                 child: Container(
                  //                   margin: EdgeInsets.symmetric(
                  //                       vertical: 5, horizontal: 8),
                  //                   height: 60,
                  //                   width: 80,
                  //                   decoration: BoxDecoration(
                  //                     color: TabColor[index],
                  //                     shape: BoxShape.rectangle,
                  //                     borderRadius:
                  //                         BorderRadius.all(Radius.circular(10)),
                  //                     boxShadow: [
                  //                       BoxShadow(
                  //                           color: grey,
                  //                           spreadRadius: 2,
                  //                           blurRadius: 2,
                  //                           offset: const Offset(0, 4)),
                  //                     ],
                  //                   ),
                  //                   child: Center(
                  //                     child: TabImages[index],
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 CatNames[index],
                  //                 style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     fontStyle: FontStyle.normal),
                  //               )
                  //             ],
                  //           );
                  //         }),
                  //   ),
                  // ),

                  //   SizedBox(
                  //     height: 20,
                  //   ),
                  //   Stack(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.all(3),
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(5),
                  //           child: Image.asset(
                  //             'assets/images/car02.jpeg',
                  //             fit: BoxFit.fill,
                  //             height: 150,
                  //             width: double.infinity,
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         top: 30,
                  //         left: 20,
                  //         child: Text(
                  //           'More Shine,',
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               color: white),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         top: 60,
                  //         left: 20,
                  //         child: Text(
                  //           'More Production',
                  //           style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //               color: white),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         top: 100,
                  //         left: 20,
                  //         child: Text(
                  //           'Get more offers %',
                  //           style: TextStyle(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w400,
                  //               color: white),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   SizedBox(
                  //     height: 10,
                  //   ),
                  //   Container(
                  //     height: 120,
                  //     child: ListView.builder(
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.horizontal,
                  //         itemCount: CatNames.length,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return Column(
                  //             children: [
                  //               GestureDetector(
                  //                 onTap: () {
                  //                   selectedIndex = index;
                  //                   // if (CatNames[selectedIndex] == "Flight") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Flight(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // } else if (CatNames[selectedIndex] == "Hotel") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Hotel(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // } else if (CatNames[selectedIndex] == "Car") {
                  //                   //   Navigator.of(context, rootNavigator: true)
                  //                   //       .push(MaterialPageRoute(
                  //                   //           builder: (context) => Cars(
                  //                   //                 categoryname: CatNames[index],
                  //                   //               )));
                  //                   // }
                  //                   // Navigator.of(context, rootNavigator: true).push(
                  //                   //   MaterialPageRoute(
                  //                   //       builder: (context) => Flight(
                  //                   //             categoryname: CatNames[index],
                  //                   //           )),
                  //                   //Cars()
                  //                   //)
                  //                   // Hotel(
                  //                   //       categoryname: CatNames[index],
                  //                   //     )),
                  //                   // );
                  //                 },
                  //                 child: Container(
                  //                   margin: EdgeInsets.symmetric(
                  //                       vertical: 5, horizontal: 8),
                  //                   height: 80,
                  //                   width: 80,
                  //                   decoration: BoxDecoration(
                  //                     color: CatColor[index],
                  //                     shape: BoxShape.rectangle,
                  //                     borderRadius:
                  //                         BorderRadius.all(Radius.circular(10)),
                  //                     boxShadow: [
                  //                       BoxShadow(
                  //                           color: grey,
                  //                           spreadRadius: 2,
                  //                           blurRadius: 2,
                  //                           offset: const Offset(0, 4)),
                  //                     ],
                  //                   ),
                  //                   child: Center(
                  //                     child: CatImages[index],
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 height: 5,
                  //               ),
                  //               Text(
                  //                 CatNames[index],
                  //                 style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     fontStyle: FontStyle.normal),
                  //               )
                  //             ],
                  //           );
                  //         }),
                  //   ),
                  //   SizedBox(
                  //     height: 10,
                  //   ),
                  //   Text(
                  //     'Fast Services',
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //         fontStyle: FontStyle.normal),
                  //   ),
                  //   SizedBox(
                  //     height: 10,
                  //   ),
                  //   Container(
                  //       child: MediaQuery.removePadding(
                  //     context: context,
                  //     removeTop: true,
                  //     child: ListView.builder(
                  //         shrinkWrap: true,
                  //         scrollDirection: Axis.vertical,
                  //         physics: ScrollPhysics(),
                  //         itemCount: 3,
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return GestureDetector(
                  //               onTap: () {
                  //                 Navigator.of(context, rootNavigator: true).push(
                  //                     MaterialPageRoute(
                  //                         builder: (context) => AddService()));
                  //               },
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     vertical: 7, horizontal: 0),
                  //                 child: SizedBox(
                  //                   height: 125,
                  //                   child: Card(
                  //                     color: Color.fromARGB(255, 248, 252, 253),
                  //                     elevation: 3,
                  //                     // color: yellow,
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(5),
                  //                       child: Row(
                  //                         mainAxisAlignment:
                  //                             MainAxisAlignment.start,
                  //                         children: [
                  //                           Container(
                  //                             height: 100,
                  //                             width: 90,
                  //                             decoration: BoxDecoration(
                  //                               borderRadius:
                  //                                   BorderRadius.circular(14),
                  //                               image: DecorationImage(
                  //                                 image: AssetImage(
                  //                                   'assets/images/car02.jpeg',
                  //                                 ),
                  //                                 fit: BoxFit.cover,
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           SizedBox(
                  //                             width: 10,
                  //                           ),
                  //                           Expanded(
                  //                               child: Padding(
                  //                             padding:
                  //                                 const EdgeInsets.only(top: 10),
                  //                             child: Container(
                  //                               child: Column(
                  //                                 crossAxisAlignment:
                  //                                     CrossAxisAlignment.start,
                  //                                 children: [
                  //                                   Text(
                  //                                     'Quick Service',
                  //                                     style: TextStyle(
                  //                                         color: black,
                  //                                         fontSize: 14,
                  //                                         fontWeight:
                  //                                             FontWeight.w600),
                  //                                   ),
                  //                                   SizedBox(
                  //                                     height: 5,
                  //                                   ),
                  //                                   Row(
                  //                                     mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .spaceBetween,
                  //                                     children: [
                  //                                       Flexible(
                  //                                         child: Text(
                  //                                           'Fix your car from the Top to Bottom  with our Specialists',
                  //                                           maxLines: 2,
                  //                                           softWrap: true,
                  //                                           style: TextStyle(
                  //                                               overflow:
                  //                                                   TextOverflow
                  //                                                       .ellipsis,
                  //                                               color: tab,
                  //                                               fontSize: 12,
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .w500),
                  //                                         ),
                  //                                       ),
                  //                                       IconButton(
                  //                                           onPressed: () {},
                  //                                           icon: Icon(
                  //                                             Icons
                  //                                                 .chevron_right_sharp,
                  //                                             size: 35,
                  //                                           )),
                  //                                     ],
                  //                                   ),
                  //                                   Text(
                  //                                     'Starts From ₹2720',
                  //                                     style: TextStyle(
                  //                                         color: black,
                  //                                         fontSize: 14,
                  //                                         fontWeight:
                  //                                             FontWeight.w600),
                  //                                   ),
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           ))
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ));
                  //         }),
                  //   ))
                ],
              ),
            ),
          ),
        ));
  }
}
