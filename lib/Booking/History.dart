import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/model/CurrentBooking_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryBook extends StatefulWidget {
  final int screen;
  HistoryBook({Key? key, required this.screen}) : super(key: key);

  @override
  State<HistoryBook> createState() => _HistoryBookState();
}

class _HistoryBookState extends State<HistoryBook> {
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
  _bookinghistory() async {
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
    _bookinghistory();
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
                          final history = list[index];
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
                                          left: 10, right: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                //height: 120,
                                                // child: Container(
                                                //   // height: 100,
                                                //   child: ClipRRect(
                                                //     borderRadius:
                                                //         BorderRadius.circular(5),
                                                //     child: Image.asset(
                                                //       'assets/images/tank.png',
                                                //       fit: BoxFit.fill,
                                                //       height: 100,
                                                //       width: 120,
                                                //     ),
                                                //   ),
                                                // ),

                                                height: 100,
                                                width: 120,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            history
                                                                .serviceImage,

                                                            //  "assets/images/delete.png"
                                                          ),
                                                          fit: BoxFit.fill)),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      history.serviceName,
                                                      //'Standard Service & Battery \nCheckup',
                                                      overflow:
                                                          TextOverflow.clip,
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
                                                      history.bookingDate
                                                          .toString(),
                                                      // '04 Tuesday,July 2023',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: dash),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          history.statusText,
                                                          // 'Completed',
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: dash),
                                                        ),
                                                        SizedBox(
                                                          width: 25,
                                                        ),
                                                        // GestureDetector(
                                                        //   onTap: () {
                                                        //     Navigator.of(context,
                                                        //             rootNavigator: true)
                                                        //         .push(MaterialPageRoute(
                                                        //             builder: (context) =>
                                                        //                 ViewDetails()));
                                                        //   },
                                                        //   child: Row(
                                                        //     mainAxisAlignment:
                                                        //         MainAxisAlignment
                                                        //             .spaceBetween,
                                                        //     children: [
                                                        //       Text(
                                                        //         'View Details',
                                                        //         style: TextStyle(
                                                        //             fontSize: 14,
                                                        //             fontWeight:
                                                        //                 FontWeight.w700,
                                                        //             color: black),
                                                        //       ),
                                                        //       Icon(Icons.chevron_right,
                                                        //           color: black)
                                                        //     ],
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
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
