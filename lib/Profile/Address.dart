import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Address extends StatefulWidget {
  Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  bool hide = false;
  String? _chosenValue;
  String? _chosenValue1;
  String? _chosenbrand;
  String? _chosenmodel;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // bool _passVisibility = true;
  TextEditingController door = TextEditingController();
  TextEditingController local = TextEditingController();
  TextEditingController pin = TextEditingController();

  bool _isLoading = true;

  Future editaddress() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    var Email = session.getString('email');
    var user_id = session.getInt('user_id');
    var url = edit_address;

    var urlparse = Uri.parse(url);
    Map data = {"user_id": user_id.toString()};
    print(data);
    http.Response res = await http.post(
      urlparse,
      body: data,
    );
    if (res.statusCode == 200) {
      var resBody = (json.decode(res.body.toString()));
      print(resBody['data']['first_name']);
      print(resBody);
      setState(() {
        _isLoading = true;

        door.text = (resBody['data']['door'].toString());
        pin.text = (resBody['data']['pincode'].toString());
        local.text = (resBody['data']['locality'].toString());
        // email.text = (resBody['data']['email'].toString());
        // about.text = (resBody['data']['about'].toString());
        // fullname.text = resBody['full_name'].toString();
      });

      return "Success";
    } else {
      _isLoading = false;
      print("error");
      print(res.body.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'Address',
          style: TextStyle(
              color: black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                hide = !hide;
              });
            },
            child: Text(
              '${!hide ? "Edit" : ""}',
              style: TextStyle(
                  color: orange, fontSize: 16, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Door No',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                  'State',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                          borderSide: const BorderSide(width: 1, color: black),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Select State',
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
                    value: _chosenbrand,
                    onChanged: (value) {
                      setState(() {
                        _chosenbrand = value;
                      });
                    },
                    items: <String>[
                      'Tamilnadu',
                      'Karnataka',
                      'Kerala',
                      'Telugana',
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
                  height: 10,
                ),
                Text(
                  'Select Country',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                          borderSide: const BorderSide(width: 1, color: black),
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'Select Country',
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
                    value: _chosenmodel,
                    onChanged: (value) {
                      setState(() {
                        _chosenmodel = value;
                      });
                    },
                    items: <String>[
                      'India',
                      'Pakisthan',
                      'China',
                      'Bangalesh',
                      'Sri Lanka'
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
                  height: 10,
                ),
                Text(
                  'Pincode',
                  style: TextStyle(
                      color: black, fontSize: 16, fontWeight: FontWeight.w700),
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
                Opacity(
                    opacity: hide ? 1 : 0,
                    child: ElevatedButton(
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
                        Navigator.pop(context);
                        // Navigator.of(context, rootNavigator: true).push(
                        //     MaterialPageRoute(builder: (context) => Service()));
                      },
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ))
              ],
            ),
          
          ),
        ),
      ),
    );
  }
}
