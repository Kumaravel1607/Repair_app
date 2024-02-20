import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';

import 'package:repair/payment/card.dart';
import 'package:repair/payment/paypal.dart';
import 'package:repair/payment/upi.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with TickerProviderStateMixin {
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
        leading: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (c) => SearchFlight()),
            //     (route) => true);
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: black,
          ),
        ),
        elevation: 2,
        titleSpacing: 1,
        title: RichText(
          text: TextSpan(
              text: 'Booking',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              children: <TextSpan>[
                TextSpan(
                  text: ' Payment',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ]),
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
                  Text(
                    'Total Price',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '₹4720',
                    style: TextStyle(
                        color: orange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Select Payment method',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                            Icon(
                              Icons.credit_card,
                              //  color: black,
                              // size: 25,
                            ),
                            SizedBox(width: 5),
                            Text("Cerdit")
                          ]),

                          Row(children: [
                            Icon(
                              Icons.money,
                              // color: black,
                              size: 25,
                            ),

                            //SizedBox(width: 5),
                            Text("Pay on Cash")
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
                      children: [CreditCard(), PayPal()],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
