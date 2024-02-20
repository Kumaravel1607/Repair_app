import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/SelectService.dart';
import 'package:repair/Services/Servicelist.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          title: Text(
            'Select Service',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: black),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   'Select Service',
                  //   style: TextStyle(
                  //       color: black, fontSize: 20, fontWeight: FontWeight.w700),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please Select Your Perferred Service Type',
                    style: TextStyle(
                        color: dash, fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
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
                                fontSize: 16,
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
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ]),
                          // Tab(text: 'Round Trip'),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height * 1.4,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ServiceList(screen_no: 1),
                        ServiceList(screen_no: 2),
                        // Service()
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
                ],
              ),
            ),
          ),
        ));
  }
}
