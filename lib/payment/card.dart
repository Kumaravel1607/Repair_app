import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/payment/confirm.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _passVisibility = true;
  bool? _checkbox = false;
  TextEditingController card = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController cvc = TextEditingController();
  TextEditingController expiry = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Card Name',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                    return "Please enter card name";
                  }

                  return null;
                },
                controller: name,
                autocorrect: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: orange),
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide(color: Blue, width: 2)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: box),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: Blue, width: 2),
                  // ),
                  // contentPadding: const EdgeInsets.only(left: 10, bottom:),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Enter your card name",
                  hintStyle: const TextStyle(color: dash, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Name on Card',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                    return "Please enter name on card";
                  }

                  return null;
                },
                controller: number,
                autocorrect: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: orange),
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide(color: Blue, width: 2)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: box),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: Blue, width: 2),
                  // ),
                  // contentPadding:
                  //     const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Enter your name on card",
                  hintStyle: const TextStyle(color: dash, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Card Number',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
                    return "Please enter card number";
                  }

                  return null;
                },
                controller: card,
                autocorrect: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: orange),
                  ),
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide(color: Blue, width: 2)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: box),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(color: Blue, width: 2),
                  // ),
                  // contentPadding:
                  //     const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  filled: true,
                  fillColor: Colors.transparent,
                  hintText: "Enter your card number",
                  hintStyle: const TextStyle(color: dash, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Expiry date',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        // onChanged: (value) {
                        //   context
                        //       .read<LoginBloc>()
                        //       .add(EmailEvent(value));
                        // },

                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter Expiry date";
                          }

                          return null;
                        },
                        controller: expiry,
                        autocorrect: true,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: orange),
                          ),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //     borderSide: BorderSide(color: Blue, width: 2)),
                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: const BorderSide(color: box),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: const BorderSide(color: Blue, width: 2),
                          // ),
                          // contentPadding:
                          //     const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Enter Expiry date",
                          hintStyle: const TextStyle(color: dash, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'CVC',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        // onChanged: (value) {
                        //   context
                        //       .read<LoginBloc>()
                        //       .add(PasswordEvent(value));
                        // },

                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter CVC";
                          }

                          return null;
                        },
                        controller: cvc,
                        autocorrect: true,
                        obscureText: _passVisibility,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: orange),
                          ),
                          // border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //     borderSide: BorderSide(color: red, width: 2)),
                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: const BorderSide(color: box),
                          // ),
                          // focusedBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide:
                          //       const BorderSide(color: Blue, width: 2),
                          // ),
                          // contentPadding: const EdgeInsets.only(
                          //     left: 24, top: 14, bottom: 13),
                          filled: true,
                          fillColor: Colors.transparent,
                          focusColor: orange,
                          hoverColor: orange,
                          //suffixIconColor: orange,
                          hintText: 'Enter CVC',
                          hintStyle: const TextStyle(color: dash, fontSize: 14),

                          suffixIcon: IconButton(
                            color: grey,
                            icon: _passVisibility
                                ? Icon(
                                    Icons.visibility_off,
                                    color: greytext,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: greytext,
                                  ),
                            onPressed: () {
                              _passVisibility = !_passVisibility;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      fillColor: MaterialStateProperty.all(
                          _checkbox == true ? orange : black),
                      activeColor: green,
                      value: _checkbox,
                      onChanged: (val) {
                        setState(() {
                          _checkbox = val;
                        });
                      }),
                  const Text(
                    'Save this card',
                    style: TextStyle(
                        color: black,
                        fontSize: 14,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: orange,
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(builder: (context) => Confirm()));
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => Navigation()));
                },
                child: Text(
                  'Confirm and Continue',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ])));
  }
}
