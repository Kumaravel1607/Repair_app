import 'package:flutter/material.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/payment/confirm.dart';

class PayPal extends StatefulWidget {
  PayPal({Key? key}) : super(key: key);

  @override
  State<PayPal> createState() => _PayPalState();
}

class _PayPalState extends State<PayPal> {
  bool? _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
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
                  'Cash on Delivery',
                  style: TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
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
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text('data'),
      //     Container(
      //       // height: 60,
      //       // width: 180,
      //       decoration: BoxDecoration(
      //         // color: Color.fromARGB(255, 235, 238, 240),
      //         border: Border(
      //           bottom: BorderSide(width: 1.0, color: grey),
      //         ),
      //         // border: Border.all(color: grey, width: 1),
      //         // borderRadius: BorderRadius.circular(5),
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.only(
      //             left: 10, right: 10, top: 10, bottom: 10),
      //         child: Row(
      //           children: [
      //             Icon(Icons.calendar_month_outlined),
      //             SizedBox(
      //               width: 10,
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   'DEPARTURE DATE',
      //                   style: TextStyle(
      //                       color: grey,
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w500),
      //                 ),
      //                 RichText(
      //                   text: TextSpan(
      //                       text: '17 Jun ',
      //                       style: TextStyle(
      //                           color: black,
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.w600),
      //                       children: <TextSpan>[
      //                         TextSpan(
      //                           text: ' Sat,2023',
      //                           style: TextStyle(
      //                               color: black,
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w300),
      //                         )
      //                       ]),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
