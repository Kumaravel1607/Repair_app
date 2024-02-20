import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Services/appointment.dart';

class ServiceAddress extends StatefulWidget {
  ServiceAddress({Key? key}) : super(key: key);

  @override
  State<ServiceAddress> createState() => _ServiceAddressState();
}

class _ServiceAddressState extends State<ServiceAddress> {
  String? _chosenValue;
  String? _chosenValue1;
  String? _chosenbrand;
  String? _chosenmodel;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // bool _passVisibility = true;
  TextEditingController door = TextEditingController();
  TextEditingController local = TextEditingController();
  TextEditingController pin = TextEditingController();
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
          'Select Our Service',
          style: TextStyle(
              color: black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Select Your Perferred Service Location',
                  style: TextStyle(
                      color: black, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Select Brand',
                //   style: TextStyle(
                //       color: black, fontSize: 16, fontWeight: FontWeight.w700),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 50,
                //   child: DropdownButtonFormField(
                //     decoration: InputDecoration(
                //       contentPadding:
                //           const EdgeInsets.only(left: 20, top: 14, right: 20),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(width: 1, color: box),
                //           borderRadius: BorderRadius.circular(5)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(width: 1, color: black),
                //           borderRadius: BorderRadius.circular(5)),
                //       hintText: 'Select Brand',
                //       // hintText: 'Date-Month-Year',

                //       hintStyle: const TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400,
                //           fontStyle: FontStyle.normal),
                //       focusedErrorBorder: new OutlineInputBorder(
                //         borderSide: BorderSide(color: red, width: 1),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       errorBorder: new OutlineInputBorder(
                //         borderSide: new BorderSide(color: red, width: 1),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     // border: OutlineInputBorder(
                //     //   borderRadius: const BorderRadius.all(
                //     //     const Radius.circular(10),
                //     //   ),
                //     // ),
                //     //               ),
                //     // decoration: InputDecoration(
                //     //   enabledBorder: OutlineInputBorder(
                //     //     borderSide: BorderSide(
                //     //         color: Colors.grey, width: 1), //<-- SEE HERE
                //     //   ),
                //     //   focusedBorder: OutlineInputBorder(
                //     //     borderSide: BorderSide(
                //     //         color: Colors.black, width: 2), //<-- SEE HERE
                //     //   ),
                //     //   filled: true,
                //     //   // fillColor: Colors.greenAccent,
                //     // ),

                //     //dropdownColor: greylite,
                //     value: _chosenbrand,
                //     onChanged: (value) {
                //       setState(() {
                //         _chosenbrand = value;
                //       });
                //     },
                //     items: <String>[
                //       'Audi',
                //       'BMW'
                //           'Toyota',
                //       'Hyndai',
                //       'Nissan',
                //       'TATA'
                //     ].map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(
                //               fontSize: 14, fontWeight: FontWeight.w500),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   'Select Model',
                //   style: TextStyle(
                //       color: black, fontSize: 16, fontWeight: FontWeight.w700),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   height: 50,
                //   child: DropdownButtonFormField(
                //     decoration: InputDecoration(
                //       contentPadding:
                //           const EdgeInsets.only(left: 20, top: 14, right: 20),
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(width: 1, color: box),
                //           borderRadius: BorderRadius.circular(5)),
                //       focusedBorder: OutlineInputBorder(
                //           borderSide: const BorderSide(width: 1, color: black),
                //           borderRadius: BorderRadius.circular(5)),
                //       hintText: 'Select Model',
                //       // hintText: 'Date-Month-Year',

                //       hintStyle: const TextStyle(
                //           fontSize: 14,
                //           fontWeight: FontWeight.w400,
                //           fontStyle: FontStyle.normal),
                //       focusedErrorBorder: new OutlineInputBorder(
                //         borderSide: BorderSide(color: red, width: 1),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //       errorBorder: new OutlineInputBorder(
                //         borderSide: new BorderSide(color: red, width: 1),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //     // border: OutlineInputBorder(
                //     //   borderRadius: const BorderRadius.all(
                //     //     const Radius.circular(10),
                //     //   ),
                //     // ),
                //     //               ),
                //     // decoration: InputDecoration(
                //     //   enabledBorder: OutlineInputBorder(
                //     //     borderSide: BorderSide(
                //     //         color: Colors.grey, width: 1), //<-- SEE HERE
                //     //   ),
                //     //   focusedBorder: OutlineInputBorder(
                //     //     borderSide: BorderSide(
                //     //         color: Colors.black, width: 2), //<-- SEE HERE
                //     //   ),
                //     //   filled: true,
                //     //   // fillColor: Colors.greenAccent,
                //     // ),

                //     //dropdownColor: greylite,
                //     value: _chosenmodel,
                //     onChanged: (value) {
                //       setState(() {
                //         _chosenmodel = value;
                //       });
                //     },
                //     items: <String>['Audi A4', '7 SUVs', 'e-tron GT']
                //         .map<DropdownMenuItem<String>>((String value) {
                //       return DropdownMenuItem<String>(
                //         value: value,
                //         child: Text(
                //           value,
                //           style: TextStyle(
                //               fontSize: 14, fontWeight: FontWeight.w500),
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                Text(
                  'Service Type',
                  style: TextStyle(
                      color: dash, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 14, right: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: box),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Select Services',
                      // hintText: 'Date-Month-Year',

                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      focusedErrorBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: const BorderRadius.all(
                    //     const Radius.circular(10),
                    //   ),
                    // ),
                    //               ),
                    // decoration: InputDecoration(
                    //   enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.grey, width: 1), //<-- SEE HERE
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.black, width: 2), //<-- SEE HERE
                    //   ),
                    //   filled: true,
                    //   // fillColor: Colors.greenAccent,
                    // ),

                    //dropdownColor: greylite,
                    value: _chosenValue,
                    onChanged: (value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                    items: <String>[
                      'In-Store Service',
                      'Door Step Service',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Or',
                    style: TextStyle(
                        color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Door Step Pick up Address',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Door No',
                  style: TextStyle(
                      color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // onChanged: (value) {
                  //   context
                  //       .read<LoginBloc>()
                  //       .add(EmailEvent(value));
                  // },

                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter door no";
                    }

                    return null;
                  },
                  controller: door,
                  autocorrect: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: orange, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: orange, width: 1),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your Door No",
                      hintStyle: const TextStyle(color: grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.push_pin_outlined,
                        color: grey,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Locality',
                  style: TextStyle(
                      color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // onChanged: (value) {
                  //   context
                  //       .read<LoginBloc>()
                  //       .add(EmailEvent(value));
                  // },

                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter locality";
                    }

                    return null;
                  },
                  controller: local,
                  autocorrect: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: orange, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: orange, width: 1),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your Locality",
                      hintStyle: const TextStyle(color: grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.public_outlined,
                        color: grey,
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'City',
                  style: TextStyle(
                      color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 14, right: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: box),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'City',
                      // hintText: 'Date-Month-Year',

                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      focusedErrorBorder: new OutlineInputBorder(
                        borderSide: BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      errorBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: red, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: const BorderRadius.all(
                    //     const Radius.circular(10),
                    //   ),
                    // ),
                    //               ),
                    // decoration: InputDecoration(
                    //   enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.grey, width: 1), //<-- SEE HERE
                    //   ),
                    //   focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.black, width: 2), //<-- SEE HERE
                    //   ),
                    //   filled: true,
                    //   // fillColor: Colors.greenAccent,
                    // ),

                    // dropdownColor: greylite,
                    value: _chosenValue1,
                    onChanged: (value) {
                      setState(() {
                        _chosenValue1 = value;
                      });
                    },
                    items: <String>[
                      'Chennai',
                      'Dharmapuri',
                      'Salem',
                      'Krishnagiri',
                      'Erode',
                      'Coimbatore',
                      'Namakkal'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Pincode',
                  style: TextStyle(
                      color: dash, fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  // onChanged: (value) {
                  //   context
                  //       .read<LoginBloc>()
                  //       .add(EmailEvent(value));
                  // },

                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter pincode";
                    }

                    return null;
                  },
                  controller: local,
                  autocorrect: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: orange, width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: orange, width: 1),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your Pincode",
                      hintStyle: const TextStyle(color: grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.public_outlined,
                        color: grey,
                      )),
                ),
                SizedBox(
                  height: 30,
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
                        MaterialPageRoute(builder: (context) => BookService()));
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
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
