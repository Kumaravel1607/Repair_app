import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Constant/toast.dart';
import 'package:repair/Navigation.dart';
import 'package:repair/Register.dart';
import 'package:repair/forgot.dart/forgotpassword.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;

  @override
  void initState() {
    // user();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _passVisibility = true;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: formkey,
      child: Container(
        margin: EdgeInsets.only(top: 120),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Center(
              //     child: Image.asset(
              //   'assets/images/log-grow.png',
              //   height: 150,
              //   fit: BoxFit.cover,
              // )),
              // Center(
              //   child: CircleAvatar(
              //     radius: 70,
              //     // backgroundColor: Colors.amberAccent,
              //     backgroundImage: AssetImage(
              //       'assets/images/school.jpeg',
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Email',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
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
                    return "Please enter Email";
                  }

                  return null;
                },
                controller: email,
                autocorrect: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: orange, width: 2)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: box),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: orange, width: 2),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your email",
                    hintStyle: const TextStyle(color: grey, fontSize: 14),
                    prefixIcon: Icon(
                      Icons.mail_rounded,
                      color: orange,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Password',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                // onChanged: (value) {
                //   context
                //       .read<LoginBloc>()
                //       .add(PasswordEvent(value));
                // },

                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }

                  return null;
                },
                controller: pass,
                autocorrect: true,
                obscureText: _passVisibility,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: red, width: 2)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: box),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: orange, width: 2),
                    ),
                    contentPadding:
                        const EdgeInsets.only(left: 24, top: 14, bottom: 13),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                        fontFamily: 'Rubik', color: grey, fontSize: 14),
                    suffixIcon: IconButton(
                      color: grey,
                      icon: _passVisibility
                          ? Icon(
                              Icons.visibility_off,
                              color: orange.withOpacity(0.6),
                            )
                          : Icon(
                              Icons.visibility,
                              color: orange,
                            ),
                      onPressed: () {
                        _passVisibility = !_passVisibility;
                        setState(() {});
                      },
                    ),
                    prefixIcon: Icon(
                      Icons.lock_rounded,
                      color: orange,
                    )),
              ),
              SizedBox(height: 25),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => ForgotScreen()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 14,
                      color: orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  // width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: orange,
                      minimumSize: const Size.fromHeight(44),
                    ),
                    onPressed: () {
                      setState(() {
                        if (formkey.currentState!.validate()) {
                          isloading = true;
                          print(isloading);
                          user();
                        }
                      });
                      // Navigator.of(context).pushAndRemoveUntil(
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => Navigation()),
                      //     (Route<dynamic> route) => false);
                      // setState(() {
                      //   if (formkey.currentState!.validate()) {
                      //     isloading = true;
                      //     print(isloading);
                      //     Navigator.of(context).pushAndRemoveUntil(
                      //         MaterialPageRoute(
                      //             builder: (BuildContext context) =>
                      //                 Navigation()),
                      //         (Route<dynamic> route) => false);
                      //   }
                      // });
                    },
                    child: isloading == true
                        ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(2.0),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => Register()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: orange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Center(
              //   child: Text(
              //     "Are you a teacher ?",
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontFamily: 'IBMPlexSans',
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              // Center(
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.of(context).pushAndRemoveUntil(
              //           MaterialPageRoute(
              //               builder: (BuildContext context) => Mobile_login()),
              //           (Route<dynamic> route) => false);
              //     },
              //     child: Text(
              //       "Login with Otp",
              //       style: TextStyle(
              //         color: orange,
              //         fontSize: 16,
              //         fontFamily: 'IBMPlexSans',
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    )));
  }

  user() async {
    // String? deviceId = await _getId();
    String? token = await FirebaseMessaging.instance.getToken();
    // print('Deviceid :' '$deviceId');

    print('token :' '$token');
    var url = login;
    var data = {"email": email.text, "password": pass.text, 'app_key': token};
    print(data);
    print(url);
    var body = json.encode(data);
    var urlparse = Uri.parse(url);

    http.Response response = await http.post(
      urlparse,
      body: data,
    );
    var response_data = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        isloading = false;
      });
      print(isloading);
      print(response_data['result']);
      print(response_data['result']['user_id']);
      print(response_data['result']['first_name']);

      print(response_data['result']['email']);
      final session = await SharedPreferences.getInstance();
      await session.setString('email', response_data['result']['email']);
      await session.setInt('user_id', response_data['result']['user_id']);
      await session.setString(
          'first_name', response_data['result']['first_name']);
      await session.setString('token', response_data['result']['token']);

      var user_name = session.getString('first_name');

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Navigation(name: user_name.toString())),
          (Route<dynamic> route) => false);

      print('Success');
      toastInfo(mesg: response_data['message'].toString());
    } else {
      setState(() {
        isloading = false;
      });
      print(isloading);
      toastInfo(mesg: response_data['message'].toString());
    }
  }
}
