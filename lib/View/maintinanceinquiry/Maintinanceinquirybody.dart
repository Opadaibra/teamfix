//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/titleoftextfield.dart';

class Maintinanceinquirybody extends StatefulWidget {
  @override
  _MaintinanceinquirybodyState createState() => _MaintinanceinquirybodyState();
}

class _MaintinanceinquirybodyState extends State<Maintinanceinquirybody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.monetization_on_sharp,
              color: kbackground,
              size: Get.size.width * 0.1,
            ),
            localeText: LocaleText("inquir", style: Headlinestyle)),
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
            margin: defaultmargin,
            padding: defaultmargin,
            decoration: kboxdecoration,
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
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "reqno")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                // Titleoftextfield(context: context, title: "problem"),
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.report_problem),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "problem")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                // Titleoftextfield(context: context, title: "repair"),
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.home_repair_service_rounded),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "repair")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                //Titleoftextfield(context: context, title: "usedtool"),
                Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon:
                            Icon(Icons.panorama_horizontal_select_rounded),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "usedtool")),
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
