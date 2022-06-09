//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';

class Endamaintenancebody extends StatefulWidget {
  @override
  _EndamaintenancebodyState createState() => _EndamaintenancebodyState();
}

class _EndamaintenancebodyState extends State<Endamaintenancebody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.add_task,
              color: kbackground,
              size: Get.width * 0.1,
            ),
            localeText: LocaleText("endmaintenance", style: Headlinestyle)),
        Verticaldefaultpadding,
        body(context, Get.size),
      ],
    );
  }

  Expanded body(BuildContext context, Size size) {
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
                  alignment: AlignmentDirectional.center,
                  width: size.width * 0.9,
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
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
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
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
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
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.attach_money_sharp),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "tocost")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  child: TextField(
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.notes),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "notes")),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Verticaldefaultpadding
              ],
            ),
          ),
          Verticaldefaultpadding,
          sendbutton(size, context)
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
                    ? "Manintenance has been End successfully👍"
                    : "تم إنهاء الصيانة بنجاح 👍",
                style: TextStyle(fontSize: 12),
              ),
            ));
          });
        },
      ),
    );
  }

  Row header(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: size.width * 0.99,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                color: ksecondrycolor, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
            alignment: Alignment.center,
            child: LocaleText('send',
                textAlign: TextAlign.center,
                style: TextStyle(color: kbackground, fontSize: 16))),
      ],
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
