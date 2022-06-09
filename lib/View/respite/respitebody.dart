//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';

class Respitebody extends StatefulWidget {
  @override
  _RespitebodyState createState() => _RespitebodyState();
}

class _RespitebodyState extends State<Respitebody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.transfer_within_a_station_rounded,
              color: kbackground,
              size: Get.size.width * 0.1,
            ),
            localeText: LocaleText("postpon", style: Headlinestyle)),
        Verticaldefaultpadding,
        body(context),
      ],
    );
  }

  Expanded body(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            decoration: kboxdecoration,
            margin: defaultmargin,
            padding: defaultmargin,
            child: Column(
              children: [
                Verticaldefaultpadding,
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.format_list_numbered),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: Locales.string(context, "reqno")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                //Titleoftextfield(context: context, title: "cause"),
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.notes),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: Locales.string(context, "cause")),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Verticaldefaultpadding,
              ],
            ),
          ),
          Verticaldefaultpadding,
          sendbutton(Get.size, context)
        ],
      ),
    );
  }

  Container sendbutton(Size size, BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      margin: buttonmargen,
      decoration: sendbuttondecoration,
      child: ElevatedButton(
        style: buttonStyle,
        child: buttontext,
        onPressed: () {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: kprimarycolor,
              duration: Duration(seconds: 2),
              content: Text(
                Locales.lang == "en"
                    ? "request has been sent successfully👍"
                    : "تم إرسال الطلب بنجاح 👍",
                style: TextStyle(fontSize: 12),
              ),
            ));
          });
        },
      ),
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
