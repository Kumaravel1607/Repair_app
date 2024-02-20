import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_html/flutter_html.dart';
import 'package:repair/Constant/color.dart';

class terms_condition extends StatefulWidget {
  const terms_condition({Key? key}) : super(key: key);

  @override
  _terms_conditionState createState() => _terms_conditionState();
}

class _terms_conditionState extends State<terms_condition> {
  bool isloading = true;
  String pagecontent = "";

  @override
  void initState() {
    super.initState();
    getpage();
  }

  Future<String> getpage() async {
    var url = "https://varmalaa.com/api/Demo/terms";
    print(url);
    var response = await http.get(Uri.parse(url));
    var page = (json.decode(response.body));

    setState(() {
      pagecontent = page['page_content'];
    });
    isloading = false;
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: black,
            )),
        backgroundColor: white,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: black),
        ),
        centerTitle: true,
      ),
      body: isloading == true
          ? Center(
              child: CircularProgressIndicator(
                color: orange,
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                  child: Html(
                data: pagecontent,
              ))),
    );
  }
}
