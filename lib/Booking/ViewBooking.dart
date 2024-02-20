import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';

class ViewDetails extends StatefulWidget {
  ViewDetails({Key? key}) : super(key: key);

  @override
  State<ViewDetails> createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            )),
        automaticallyImplyLeading: false,
        titleSpacing: 5,
        title: Text(
          'View Booking',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
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
                              // Navigator.of(context, rootNavigator: true)
                              //     .push(MaterialPageRoute(
                              //         builder: (context) =>
                              //             AddService()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 0),
                              child: SizedBox(
                                // height: 210,
                                child: Card(
                                  // elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              //height: 120,
                                              child: Container(
                                                // height: 100,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.asset(
                                                    'assets/images/tank.png',
                                                    fit: BoxFit.fill,
                                                    height: 80,
                                                    width: 150,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '-  Oil Service  ',
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: black),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '-  Standard Service  ',
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: dash),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '- ₹920',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: orange),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      }),
                )),
                Container(
                  child:
                      //  _statusnum == 0
                      //     ? null
                      //     :
                      Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: AnotherStepper(
                            stepperList: [
                              StepperData(
                                  title: StepperText(
                                    "Booking Initizalised",
                                    textStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: StepperText(''),
                                  iconWidget: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: orange,
                                        // color: _statusnum > 4
                                        //     ? Colors.orange
                                        //     : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  )),
                              StepperData(
                                  title: StepperText(
                                    "Order Confirmed",
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    // textStyle: const TextStyle(
                                    //   color: Colors.grey,
                                    // ),
                                  ),
                                  subtitle: StepperText(""),
                                  iconWidget: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: orange,
                                        // color: _statusnum > 0
                                        //     ? Colors.blueAccent
                                        //     : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    //child: Icon(Icons.add),
                                  )),
                              StepperData(
                                  title: StepperText(
                                    "Door step Pick up",
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: StepperText(
                                    "",
                                  ),
                                  iconWidget: Container(
                                    decoration: BoxDecoration(
                                        color: orange,
                                        // color: _statusnum > 1
                                        //     ? orange
                                        //     : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )),
                              StepperData(
                                  title: StepperText(
                                    "Service Process going on",
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: StepperText(""),
                                  iconWidget: Container(
                                    decoration: BoxDecoration(
                                        color: orange,
                                        // color: _statusnum > 2
                                        //     ? orange
                                        //     : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )),
                              StepperData(
                                  title: StepperText(
                                    "Delivered",
                                    textStyle: const TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  subtitle: StepperText(""),
                                  iconWidget: Container(
                                    decoration: BoxDecoration(
                                        color: orange,
                                        // color: _statusnum > 3
                                        //     ? Colors.orange
                                        //     : Colors.grey,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  )),
                            ],
                            stepperDirection: Axis.vertical,
                            iconWidth: 20,
                            iconHeight: 20,
                            activeBarColor: Colors.blue,
                            inActiveBarColor: Colors.grey,
                            //inverted: true,
                            verticalGap: 15,
                            activeIndex: 1,
                            barThickness: 2,
                          ),
                        ),
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
}
