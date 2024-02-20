import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Login.dart';
import 'package:repair/Navigation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _passVisibility = true;
  late String _email, _name;
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Sign Up ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                'Use phone',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: orange),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return "Please enter a valid email address";
                              }
                              return null;
                            },
                            // onSaved: (email) {
                            //   _email = email!;
                            // },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: red, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: orange, width: 2),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 10, top: 14, bottom: 13),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your email',
                                hintStyle: const TextStyle(
                                    color: grey,
                                    fontFamily: 'Rubik',
                                    fontSize: 14),
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: orange,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }

                              return null;
                            },
                            // onSaved: (input) => baseModel.password = input!,
                            controller: pass,
                            autocorrect: true,
                            obscureText: _passVisibility,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: red, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: orange, width: 2),
                                ),
                                contentPadding: const EdgeInsets.only(
                                    left: 24, top: 14, bottom: 13),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter your password',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Rubik',
                                    color: grey,
                                    fontSize: 14),
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
                                  Icons.lock,
                                  color: orange,
                                )
                                // suffixIcon: const Padding(
                                //   padding: EdgeInsets.only(right: 10),
                                //   child: IconTheme(
                                //     data: IconThemeData(
                                //       color: secondary,
                                //     ),
                                //     child: Icon(
                                //       Icons.visibility_off,
                                //       color: grey,
                                //     ),
                                //   ),
                                // ),
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'UserName',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter name";
                              }
                              return null;
                            },
                            // onSaved: (name) {
                            //   _name = name!;
                            // },
                            controller: name,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: red, width: 2)),
                                contentPadding: const EdgeInsets.only(
                                    left: 24, top: 14, bottom: 13),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: orange, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter username',
                                hintStyle: const TextStyle(
                                    color: grey,
                                    fontFamily: 'Rubik',
                                    fontSize: 14),
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(24),
                                //   borderSide: BorderSide(
                                //     color: grey,
                                //   ),
                                // ),
                                // prefixIcon: IconTheme(
                                //   data: IconThemeData(
                                //     color: secondary,
                                //   ),
                                //   child: Icon(Icons.email),
                                // ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: orange,
                                )),
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: orange,
                              minimumSize: const Size.fromHeight(44),
                            ),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                user();
                              }
                              // var username;
                              // if (formkey.currentState!.validate()) {
                              //   Navigator.of(context).push(MaterialPageRoute(
                              //       builder: (context) => Navigation(
                              //             name: username.toString(),
                              //           )));
                              // } else {}
                            },
                            // onPressed: () {
                            //   // Navigator.of(context).push(
                            //   //     MaterialPageRoute(builder: (context) => HomeScreen()));
                            // },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                          // Row(children: const <Widget>[
                          //   Expanded(
                          //       child: Divider(
                          //     indent: 10.0,
                          //     endIndent: 10.0,
                          //     thickness: 1,
                          //     color: grey,
                          //   )),
                          //   Text(
                          //     'or Continue with',
                          //     style: TextStyle(color: grey, fontSize: 14),
                          //   ),
                          //   Expanded(
                          //       child: Divider(
                          //     indent: 10.0,
                          //     endIndent: 10.0,
                          //     thickness: 1,
                          //     color: grey,
                          //   )),
                          // ]),
                          // const SizedBox(
                          //   height: 36,
                          // ),
                          // const SizedBox(
                          //   height: 22,
                          // ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Login()));
                              },
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                      text: ' Already have an account?',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' Login',
                                          style: TextStyle(
                                            color: orange,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        )
                                      ]),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }

  user() async {
    var jsonResponse;
    var data = {
      'email': email.text,
      'first_name': name.text,
      'password': pass.text,
    };
    print(data);
    // var url = 'http://192.168.29.242:8000/api/register';
    // var url = api_url + 'register';
    var url = register;
    var urlparse = Uri.parse(url);
    var body = json.encode(data);

    var response = await http.post(
      urlparse,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    print(response.body);
    print(response.statusCode);
    var response_data = json.decode(response.body.toString());
    print(response_data);
    if (response.statusCode == 200) {
      final session = await SharedPreferences.getInstance();

      await session.setInt('user_id', response_data['user_id']);
      print(response_data['user_id']);
      print(response_data['email']);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Navigation(
                    name: name.text,
                  )));
      print('Sucessfull');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response_data['message']),
        backgroundColor: Colors.red.shade300,
      ));
      print('Error');
    }
  }
}
