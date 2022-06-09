//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';

class Showreqbody extends StatefulWidget {
  @override
  _ShowreqbodyState createState() => _ShowreqbodyState();
}

class _ShowreqbodyState extends State<Showreqbody> {
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
        Expanded(
            child: ListView(
          children: [],
        )),
      ],
    );
  }
}
