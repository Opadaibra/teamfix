//dashboard BODY

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:http/http.dart' as http;
import 'package:teamfix/constants/constant.dart';

class Showreqbody extends StatefulWidget {
  @override
  _ShowreqbodyState createState() => _ShowreqbodyState();
}

class _ShowreqbodyState extends State<Showreqbody> {
  List userdata = [];
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      viewprod();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.view_stream,
              color: kbackground,
              size: Get.size.width * 0.1,
            ),
            localeText: LocaleText("showreq", style: Headlinestyle)),
        Expanded(child: body()),
      ],
    );
  }

  ListView body() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(5, 0),
            )
          ], borderRadius: BorderRadius.circular(20), color: kbackground),
          child: GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: "details",
                content: Column(
                  children: [
                    //   ListTile(
                    //     leading: Text(
                    //       " اسم الجهاز",
                    //     ),
                    //     trailing: Text("${userdata[index]["name"]}"),
                    //   ),
                    //   ListTile(
                    //     leading: Text(
                    //       "تاريخ بداية الكفالة ",
                    //     ),
                    //     trailing:
                    //         Text("${userdata[index]["start_warranty_date"]}"),
                    //   ),
                    //   ListTile(
                    //     leading: Text("تاريخ نهاية الكفالة"),
                    //     trailing: Text("${userdata[index]["end_warranty_date"]}"),
                    //   ),
                    //   ListTile(
                    //     leading: Text(
                    //       " رقم الجهاز ",
                    //     ),
                    //     trailing: Text("${userdata[index]["syrial_number"]}"),
                    //   ),
                    //   ListTile(
                    //     leading: Text(
                    //       " حالة الجهاز ",
                    //     ),
                    //     trailing: Text("${userdata[index]["status"]}"),
                    //   ),
                  ],
                ),
              );
            },
            child: Column(
              children: [
                // ListTile(
                //   leading: Text(
                //     " اسم الجهاز",
                //   ),
                //   trailing: Text("${userdata[index]["name"]}"),
                // ),
                // ListTile(
                //   leading: Text("تاريخ نهاية الكفالة"),
                //   trailing: Text("${userdata[index]["end_warranty_date"]}"),
                // ),
              ],
            ),
          ),
        );
      },
      itemCount: userdata.isEmpty ? 0 : userdata.length,
    );
  }

  Future viewprod() async {
    final queryParameters = {
      'number': "phonenumber",
    };
    final uri = Uri.https('al-hafez.herokuapp.com',
        '/api/customer/get_all_products', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var responsebody = jsonDecode(response.body);
      for (int i = 0; i < responsebody.length; i++) {
        setState(() {
          userdata.add(responsebody[i]);
        });
      }
      print(userdata);
    } else {
      print("Error ${response.body}");
    }
    // userdata = respone["id"];
  }
}
