import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Booking/ViewBooking.dart';
import 'package:repair/model/CurrentBooking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CurrentBook extends StatefulWidget {
  final int screen;
  CurrentBook({Key? key, required this.screen}) : super(key: key);

  @override
  State<CurrentBook> createState() => _CurrentBookState();
}

class _CurrentBookState extends State<CurrentBook> {
  Future<List<CurrentBooking>> fetchBooking() async {
    SharedPreferences session = await SharedPreferences.getInstance();

    var user_id = session.getInt('user_id');
    List<CurrentBooking> list = [];

    var category_id = widget.screen;
    Map data = {
      'booking_status': category_id.toString(),
      'user_id': user_id.toString()
    };
    print('-----xxx----');
    print(data);
    var url = Current_Booking;
    var urlparse = Uri.parse(url);

    final response = await http.post(urlparse, body: data);
    print(urlparse);

    // list = DatumResponse(response.body);
    var responseBody = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      print(responseBody);
      list = CurrentBookingResponse(jsonEncode(responseBody['result']));

      // print(list);
      return list;
    } else {
      throw Exception("Problem in fetching ");
    }
    // return list;
  }

  static List<CurrentBooking> CurrentBookingResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CurrentBooking>((json) => CurrentBooking.fromJson(json))
        .toList();
  }

  List<CurrentBooking> list = [];
  bool isLoading = true;
  _booking() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    print("--------");
    // print(email);
    fetchBooking().then((results) {
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
    _booking();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: isLoading == true
                ? CircularProgressIndicator()
                : list.length == 0
                    ? Text("No List Found")
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          final booking = list[index];
                          return GestureDetector(
                              onTap: () {
                                // Navigator.of(context, rootNavigator: true)
                                //     .push(MaterialPageRoute(
                                //         builder: (context) =>
                                //             AddService()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                child: SizedBox(
                                  // height: 210,
                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5, right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                // height: 100,
                                                // width: 100,
                                                // child: Container(
                                                //   decoration: BoxDecoration(
                                                //       borderRadius:
                                                //           BorderRadius.circular(5),
                                                //       image: DecorationImage(
                                                //           image: NetworkImage(
                                                //             booking.serviceImage,

                                                //             //  "assets/images/delete.png"
                                                //           ),
                                                //           fit: BoxFit.fill)),
                                                // ),
                                                // height: 100,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  // child: Image.asset(
                                                  //   'assets/images/ser.jpg',
                                                  //   fit: BoxFit.fill,
                                                  //   height: 100,
                                                  //   width: 110,
                                                  // ),
                                                  child: Image.network(
                                                    booking.serviceImage,
                                                    //'assets/images/ser.jpg',
                                                    fit: BoxFit.cover,
                                                    height: 100,
                                                    width: 110,
                                                  ),
                                                ),
                                                // ),
                                                // child: Container(
                                                //   height: 150,
                                                //   width: double.infinity,
                                                //   decoration: BoxDecoration(
                                                //     borderRadius:
                                                //         BorderRadius.circular(5),
                                                //     image: DecorationImage(
                                                //       image: NetworkImage(
                                                //         booking.serviceImage,
                                                //       ),

                                                //       // image: AssetImage(
                                                //       //   'assets/images/car02.jpeg',
                                                //       // ),
                                                //       fit: BoxFit.fill,
                                                //     ),
                                                //   ),
                                                // ),
                                                //),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    booking.serviceName,
                                                    // 'Standard Service & Battery \nCheckup',
                                                    overflow: TextOverflow.clip,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: black),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    booking.bookingDate
                                                        .toString(),
                                                    //  '11 Tuesday,July 2023',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: dash),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: 'Booking No : ',
                                                        style: TextStyle(
                                                            color: dash,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: booking
                                                                .bookingNo,
                                                            //' 12KS122020',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          )
                                                        ]),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        booking.statusText,
                                                        // 'Processing',
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: (booking
                                                                        .statusText ==
                                                                    'Confirmed')
                                                                ? Colors.blue
                                                                : (booking.statusText) ==
                                                                        'Processing'
                                                                    ? Colors
                                                                        .green
                                                                    : (booking.statusText) ==
                                                                            'Completed'
                                                                        ? Colors
                                                                            .grey
                                                                        : Colors
                                                                            .yellow
                                                                            .shade500),
                                                      ),
                                                      SizedBox(
                                                        width: 25,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ViewDetails()));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'View Details',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      orange),
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .chevron_right,
                                                                size: 20,
                                                                color: orange)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
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
    ));
  }
}
