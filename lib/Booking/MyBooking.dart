import 'package:flutter/material.dart';
import 'package:repair/Booking/CurrentBooking.dart';
import 'package:repair/Booking/History.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Booking/ViewBooking.dart';

class MyBooking extends StatefulWidget {
  MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        // leading: GestureDetector(
        //   onTap: () {
        //     // Navigator.of(context).pushAndRemoveUntil(
        //     //     MaterialPageRoute(builder: (c) => SearchFlight()),
        //     //     (route) => true);
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back,
        //     size: 25,
        //     color: black,
        //   ),
        // ),
        // elevation: 2,
        // titleSpacing: 5,
        title: Text(
          'My Booking',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: black),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: Icon(
        //       Icons.list_rounded,
        //       color: black,
        //     ),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
            color: white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            Icon(
                              Icons.credit_card,
                              //  color: black,
                              // size: 25,
                            ),
                            SizedBox(width: 5),
                            Text("Booking")
                          ]),

                          Row(children: [
                            Icon(
                              Icons.history,
                              // color: black,
                              size: 25,
                            ),

                            //SizedBox(width: 5),
                            Text("History")
                          ]),

                          // Tab(text: 'Round Trip'),
                          // Row(children: [
                          //   Icon(
                          //     Icons.double_arrow,
                          //     //color: black,
                          //     size: 25,
                          //   ),
                          //   SizedBox(width: 5),
                          //   Text("UPI")
                          // ]),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        CurrentBook(screen: 1),
                        HistoryBook(screen: 2),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
