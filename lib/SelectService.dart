import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:repair/Services/ServiceAddress.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/MoreService.dart';

class Service extends StatefulWidget {
  Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: white,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: black,
      //       )),
      // ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: ScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              ServiceAddress()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 0),
                                  child: SizedBox(
                                    height: 210,
                                    child: Card(
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Standard Service',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      '- Every 1000km/6months',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '- Takes 6-8 Hours',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '- 1 Month warrantly',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      '- Top to bottom screening',
                                                      style: TextStyle(
                                                          color: black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  fit: StackFit.passthrough,
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child: Image.asset(
                                                          'assets/images/car02.jpeg',
                                                          fit: BoxFit.fill,
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Positioned(
                                                      bottom: -6,
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(orange),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context,
                                                                  rootNavigator:
                                                                      true)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          MoreService()));
                                                        },
                                                        child: Text(
                                                          'ADD',
                                                          style: TextStyle(
                                                              color: white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            DottedLine(
                                                // dashLength: 50,
                                                // dashGapLength: 1,
                                                // lineThickness: 1,
                                                // dashRadius: 0,
                                                ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '₹2720',
                                              style: TextStyle(
                                                  color: black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
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
    );
  }
}
