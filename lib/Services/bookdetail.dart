import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/payment/card.dart';
import 'package:repair/payment/payment.dart';
import 'package:repair/payment/paypal.dart';
import 'package:repair/payment/upi.dart';

class BookingDetail extends StatefulWidget {
  BookingDetail({Key? key}) : super(key: key);

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);
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
          'Booking Detail',
          style: TextStyle(
              color: black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset(
                            'assets/images/car01.jpeg',
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Model :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Service Type :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Service Details :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Booking Date :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Booking Time :',
                                  style: TextStyle(
                                      color: tab,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Audi',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Audi 14',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'In Store-Service',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Premium Service',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '03-07-2023',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '11:00 AM',
                                  style: TextStyle(
                                      color: black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: RichText(
                              text: TextSpan(
                                text: '₹3720',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '/incl all taxes',
                                      style: TextStyle(
                                          color: dash,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10)),
                                ],
                              ),
                            )

                                //  Text(
                                //     '₹ 1720',
                                //     style: TextStyle(
                                //         color: black,
                                //         fontSize: 20,
                                //         fontWeight: FontWeight.w600),
                                //   )
                                // ,
                                ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    // side: const BorderSide(
                                    //   width: 2,
                                    //   color: Blue,
                                    // ),
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: orange,
                                // minimumSize: const Size.fromHeight(44),
                              ),
                              onPressed: () {
                                // _showBottomSheet();
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => Payment()));
                              },
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _showBottomSheet() {
  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (
  //         BuildContext bc,
  //       ) {
  //         return StatefulBuilder(builder: (BuildContext context,
  //             StateSetter setState /*You can rename this!*/) {
  //           return Wrap(children: <Widget>[
  //             Container(
  //                 color: white,
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(10),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Total Price',
  //                         style: TextStyle(
  //                             fontSize: 16, fontWeight: FontWeight.w600),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                         '₹4720',
  //                         style: TextStyle(
  //                             color: orange,
  //                             fontSize: 24,
  //                             fontWeight: FontWeight.bold),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Text(
  //                         'Select Payment method',
  //                         style: TextStyle(
  //                             fontSize: 16, fontWeight: FontWeight.w600),
  //                       ),
  //                       SizedBox(
  //                         height: 10,
  //                       ),
  //                       Container(
  //                         height: 50,
  //                         child: Card(
  //                           color: greylite,
  //                           elevation: 2,
  //                           // height: 50,
  //                           child: TabBar(
  //                             //  indicatorPadding: EdgeInsets.all(10),
  //                             controller: tabController,
  //                             indicator: ShapeDecoration(
  //                                 color: orange,
  //                                 //   shape: StadiumBorder(),
  //                                 // ),
  //                                 shape: RoundedRectangleBorder(
  //                                     borderRadius: new BorderRadius.all(
  //                                         new Radius.circular(5)))),
  //                             // color: Color.fromARGB(255, 109, 179, 236)),
  //                             // color: Colors.indigo,
  //                             unselectedLabelColor: black,
  //                             labelColor: white,
  //                             labelStyle: TextStyle(
  //                                 fontSize: 14, fontWeight: FontWeight.w500),
  //                             tabs: [
  //                               Row(children: [
  //                                 Icon(
  //                                   Icons.credit_card,
  //                                   //  color: black,
  //                                   // size: 25,
  //                                 ),
  //                                 SizedBox(width: 5),
  //                                 Text("Card")
  //                               ]),

  //                               Row(children: [
  //                                 Icon(
  //                                   Icons.paypal_rounded,
  //                                   // color: black,
  //                                   size: 25,
  //                                 ),

  //                                 //SizedBox(width: 5),
  //                                 Text("PayPal")
  //                               ]),

  //                               // Tab(text: 'Round Trip'),
  //                               Row(children: [
  //                                 Icon(
  //                                   Icons.double_arrow,
  //                                   //color: black,
  //                                   size: 25,
  //                                 ),
  //                                 SizedBox(width: 5),
  //                                 Text("UPI")
  //                               ]),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       Container(
  //                         height: MediaQuery.of(context).size.height * 1,
  //                         child: TabBarView(
  //                           controller: tabController,
  //                           children: [Credit(), PayPal(), Upi()],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 )),

  //             // Padding(
  //             //   padding: const EdgeInsets.all(10),
  //             //   child: Column(
  //             //     crossAxisAlignment: CrossAxisAlignment.start,
  //             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             //     children: [
  //             //       Row(
  //             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             //         children: [
  //             //           Text(
  //             //             'Enter Card Details',
  //             //             style: TextStyle(
  //             //                 color: black,
  //             //                 fontSize: 16,
  //             //                 fontWeight: FontWeight.w600),
  //             //           ),
  //             //           IconButton(
  //             //               onPressed: () {
  //             //                 Navigator.pop(context);
  //             //               },
  //             //               icon: Icon(Icons.close))
  //             //         ],
  //             //       ),
  //             //       Credit()
  //             //     ],
  //             //   ),
  //             // ),
  //           ]);
  //         });
  //       });
  // }
}
