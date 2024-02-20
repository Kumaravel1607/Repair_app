import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:repair/Api/Api.dart';
import 'package:repair/ApiServices/remoteservice.dart';
import 'package:repair/Constant/color.dart';
import 'package:repair/Constant/toast.dart';
import 'package:repair/Profile/AppBtn.dart';
import 'package:repair/Profile/Color.dart';
//import 'package:repair/Profile/Demo_Localization.dart';
import 'package:repair/model/FAQ_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// class Item {
//   final String id;
//   final String expandedValue;
//   final String headerValue;
//   Item(
//     this.id,
//     this.expandedValue,
//     this.headerValue,
//   );

//   factory Item.fromJson(dynamic json) {
//     return Item(
//         "${json['id']}", "${json['expandedValue']}", "${json['headerValue']}");
//   }
// }

// var mylist = [
//   {
//     "id": "1",
//     "headerValue": "What does FAQ mean?",
//     "expandedValue":
//         "A frequently asked questions list is often used in articles, websites, email lists, and online forums where common questions tend to recur, for example through posts or queries by new users related to common knowledge gaps."
//   },
//   {
//     "id": "2",
//     "headerValue": "What does FAQ mean?",
//     "expandedValue":
//         "A frequently asked questions list is often used in articles, websites, email lists, and online forums where common questions tend to recur, for example through posts or queries by new users related to common knowledge gaps."
//   }
// ];

// getFeedbackList() {
//   return mylist.map((json) => Item.fromJson(json)).toList();
// }

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> with TickerProviderStateMixin {
  bool _isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // String? privacy;
  // Animation? buttonSqueezeanimation;
  // AnimationController? buttonController;
  // bool _isNetworkAvail = true;
  List<Faq> faqsList = [];
  List<String> selectedId = [];
  int selectedIndex = 1;
  List toggled = [];
  bool flag = true;
  bool expand = true;
  bool isLoadingmore = true;
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // controller.addListener(_scrollListener);
    // getFaqs();
    _faqlist();
    // buttonController = AnimationController(
    //     duration: const Duration(milliseconds: 2000), vsync: this);

    // buttonSqueezeanimation = Tween(
    //   begin: 100,
    //   end: 50.0,
    // ).animate(CurvedAnimation(
    //   parent: buttonController!,
    //   curve: const Interval(
    //     0.0,
    //     0.150,
    //   ),
    // ));
  }

  @override
  void dispose() {
    // buttonController!.dispose();
    controller.removeListener(() {});
    super.dispose();
  }

  // _scrollListener() {
  //   if (controller.offset >= controller.position.maxScrollExtent &&
  //       !controller.position.outOfRange) {
  //     if (mounted) {
  //       if (mounted) {
  //         setState(() {
  //           isLoadingmore = true;
  //           getFaqs();
  //         });
  //       }
  //     }
  //   }
  // }

  // Future<void> _playAnimation() async {
  //   try {
  //     await buttonController!.forward();
  //   } on TickerCanceled {}
  // }

  // noIntImage() {
  //   return SvgPicture.asset(
  //     'assets/images/no_internet.svg',
  //     fit: BoxFit.contain,
  //   );
  // }

  // String? getTranslated(BuildContext context, String key) {
  //   return DemoLocalization.of(context)!.translate(key);
  // }

  // noIntText(BuildContext context) {
  //   return Text(getTranslated(context, 'NO_INTERNET')!,
  //       style: Theme.of(context)
  //           .textTheme
  //           .headline5!
  //           .copyWith(color: Colors.yellow, fontWeight: FontWeight.normal));
  // }

  // noIntDec(BuildContext context) {
  //   return Container(
  //     padding:
  //         const EdgeInsetsDirectional.only(top: 30.0, start: 30.0, end: 30.0),
  //     child: Text(getTranslated(context, 'NO_INTERNET_DISC')!,
  //         textAlign: TextAlign.center,
  //         style: Theme.of(context).textTheme.headline6!.copyWith(
  //               color: Colors.yellow,
  //               fontWeight: FontWeight.normal,
  //             )),
  //   );
  // }

  // Future<bool> isNetworkAvailable() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }

  // Widget noInternet(BuildContext context) {
  //   return Center(
  //     child: SingleChildScrollView(
  //       child: Column(mainAxisSize: MainAxisSize.min, children: [
  //         noIntImage(),
  //         noIntText(context),
  //         noIntDec(context),
  //         AppBtn(
  //           title: getTranslated(context, 'TRY_AGAIN_INT_LBL'),
  //           btnAnim: buttonSqueezeanimation,
  //           btnCntrl: buttonController,
  //           onBtnSelected: () async {
  //             _playAnimation();

  //             Future.delayed(const Duration(seconds: 2)).then((_) async {
  //               _isNetworkAvail = await isNetworkAvailable();
  //               if (_isNetworkAvail) {
  //                 Navigator.pushReplacement(
  //                     context,
  //                     CupertinoPageRoute(
  //                         builder: (BuildContext context) => super.widget));
  //               } else {
  //                 await buttonController!.reverse();
  //                 if (mounted) setState(() {});
  //               }
  //             });
  //           },
  //         )
  //       ]),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
          title: Text(
            'FAQ',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: black),
          ),
        ),
        // appBar: getSimpleAppBar(widget.title!, context),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              controller: controller,
              itemCount: users.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return (index == users.length && isLoadingmore)
                    ? const Center(child: CircularProgressIndicator())
                    : listItem(index);
              },
            )));
  }

  listItem(int index) {
    return Card(
        //color: black,
        elevation: 0,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            if (mounted) {
              setState(() {
                selectedIndex = index;
                flag = !flag;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(users[index].faqTitle.toString(),
                          style: TextStyle(
                              color: black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                  selectedIndex != index || flag
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      users[index].faqDescription.toString(),
                                      style: TextStyle(
                                          color: dash,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ))),
                            const Icon(Icons.keyboard_arrow_down)
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Text(
                                        users[index].faqDescription.toString(),
                                        style: TextStyle(
                                            color: dash,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              const Icon(Icons.keyboard_arrow_up)
                            ]),
                ]),
          ),
        ));
  }

  List<Faq> users = [];
  bool isloading = true;
  _faqlist() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    print("--------");
    var id = session.getInt('id');
    var email = session.getString('email');
    var token = session.getString('token');
    print("--------");
    // print(email);
    // print(student_id);

    RemoteService.faqdata().then((results) {
      setState(() {
        isloading = false;
        users = results;

        //print(users[0].gameTittle);
      });
    });
  }

  // Future<void> getFaqs() async {
  //   // _isNetworkAvail = await isNetworkAvailable();
  //   // if (_isNetworkAvail) {
  //   //   try {
  //   var url = faq;
  //   var urlparse = Uri.parse(url);

  //   final response = await http.post(
  //     urlparse,
  //   );
  //   var response_data = json.decode(response.body.toString());
  //   print(response_data);
  //   if (response.statusCode == 200) {
  //     // Navigator.push(
  //     //     context, MaterialPageRoute(builder: (context) => Navigation()));
  //     print('Sucessfull');
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(response_data['message']),
  //       backgroundColor: Colors.red.shade300,
  //     ));
  //     print('Error');
  //   }
  // }

  // _faqlist() async {
  //   SharedPreferences session = await SharedPreferences.getInstance();
  //   print("--------");
  //   var id = session.getInt('id');
  //   var email = session.getString('email');
  //   var token = session.getString('token');
  //   print("--------");
  //   // print(email);
  //   // print(student_id);

  //   RemoteService.faqdata().then((results) {
  //     setState(() {
  //       _isLoading = false;
  //       // users = results;

  //       //print(users[0].gameTittle);
  //     });
  //   });
  // }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.black),
      ),
      backgroundColor: Theme.of(context).colorScheme.white,
      elevation: 1.0,
    ));
  }
}
// class FAQ extends StatefulWidget {
//   const FAQ({Key? key}) : super(key: key);

//   @override
//   State<FAQ> createState() => _FAQState();
// }

// class _FAQState extends State<FAQ> {
//   // final List<Item> _data = ;





//  List<Faq> users = [];
//   bool isloading = true;
//   _faqlist() async {
//     SharedPreferences session = await SharedPreferences.getInstance();
//     print("--------");
//     var id = session.getInt('id');
//     var email = session.getString('email');
//     var token = session.getString('token');
//     print("--------");
//     // print(email);
//     // print(student_id);

//     RemoteService.faqdata().then((results) {
//       setState(() {
//         isloading = false;
//         users = results;

//         //print(users[0].gameTittle);
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//    // print(_data);
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: white,
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: black,
//               )),
//           title: Text(
//             'FAQ',
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.w600, color: black),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 child: _buildPanel(),
//               ),
//             ),
//           ),
//         ));
//   }

//   Widget _buildPanel() {
//     return ExpansionPanelList.radio(
//       initialOpenPanelValue: users.length,
//       children: .map<ExpansionPanelRadio>(
//         (Item item) {
//           return ExpansionPanelRadio(
//             value: item.id,
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return Padding(
//                 padding: const EdgeInsets.only(bottom: 5),
//                 child: ListTile(
//                   title: Text(item.headerValue),
//                 ),
//               );
//             },
//             body: ListTile(
//               title: Text(item.expandedValue),
//             ),
//           );
//         },
//       ).toList(),
//     );
//   }
// }
