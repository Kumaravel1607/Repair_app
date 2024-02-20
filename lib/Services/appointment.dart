import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:repair/Services/bookdetail.dart';

class BookService extends StatefulWidget {
  BookService({Key? key}) : super(key: key);

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController time = TextEditingController();
  DateTime _selectedValue = DateTime.now();
  DatePickerController _controller = DatePickerController();
  var date = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: white,
          titleSpacing: 2,
          title: Text(
            'Schedule an Appointment',
            style: TextStyle(
                color: black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: black,
              )),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Please Select Your Perferred Date and Time',
                    //overflow: TextOverflow.visible,
                    maxLines: 2,
                    style: TextStyle(
                        color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    child: Image.asset(
                      'assets/images/car01.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 80,
                    child: DatePicker(
                      DateTime.now(),
                      width: 50,
                      height: 60,
                      controller: _controller,
                      initialSelectedDate: DateTime.now(),
                      selectionColor: orange,
                      selectedTextColor: white,
                      onDateChange: (date_s) {
                        // New date selected
                        print(date_s);
                        print('------');
                        setState(() {
                          final f = DateFormat('yyyy-MM-dd');

                          date = f.format(date_s);
                          print(date);
                          print('......');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Time',
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.none,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter time";
                      }
                      return null;
                    },
                    onSaved: (time) {
                      time = time!;
                    },
                    onTap: () async {
                      final TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 9, minute: 00),
                          initialEntryMode: TimePickerEntryMode.input);
                      if (pickedTime != null) {
                        setState(() {
                          MaterialLocalizations localizations =
                              MaterialLocalizations.of(context);
                          String formattedTime = localizations.formatTimeOfDay(
                              pickedTime,
                              alwaysUse24HourFormat: false);

                          time.text = formattedTime.toString();
                          // String formattedtime = DateFormat('hh:mm a')
                          //     .format(pickedTime);
                          // timeController.text =
                          //     formattedtime.toString();
                        });
                      }
                    },
                    controller: time,
                    decoration: InputDecoration(
                        // fillColor: light,
                        // filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Blue, width: 2)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: grey),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 2, color: Blue),
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Time',
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),

                        // suffixIcon: Icon(Icons.access_time, color: greylite)
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                      context: context,
                                      initialTime:
                                          const TimeOfDay(hour: 9, minute: 00),
                                      initialEntryMode:
                                          TimePickerEntryMode.input);

                              if (pickedTime != null) {
                                setState(() {
                                  MaterialLocalizations localizations =
                                      MaterialLocalizations.of(context);
                                  String formattedTime =
                                      localizations.formatTimeOfDay(pickedTime,
                                          alwaysUse24HourFormat: false);

                                  time.text = formattedTime.toString();
                                  // String formattedtime = DateFormat('hh:mm a')
                                  //     .format(pickedTime);
                                  // timeController.text =
                                  //     formattedtime.toString();
                                });
                              }
                            },
                            icon: Icon(
                              Icons.access_time,
                              color: greylite,
                            ))),
                  ),
                  SizedBox(
                    height: 50,
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
                      minimumSize: const Size.fromHeight(44),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (context) => BookingDetail()));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
