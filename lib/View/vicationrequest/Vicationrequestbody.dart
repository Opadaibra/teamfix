//dashboard BODY
// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';

class Vicationrequestbody extends StatefulWidget {
  @override
  _vicationrequestbodyState createState() => _vicationrequestbodyState();
}

// ignore: camel_case_types
class _vicationrequestbodyState extends State<Vicationrequestbody> {
  DateTime _dateTime = DateTime.now();
  DateTime enddate = DateTime.now();
  var pickeddate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.sick_rounded,
              color: kbackground,
              size: Get.size.width * 0.1,
            ),
            localeText: LocaleText("vacation", style: Headlinestyle)),
        body(context),
      ],
    );
  }

  Expanded body(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Verticaldefaultpadding,
          Container(
            decoration: kboxdecoration,
            padding: defaultmargin,
            margin: defaultmargin,
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
                        prefixIcon: Icon(Icons.notes),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "vacationorder")),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Verticaldefaultpadding,
                Text(DateFormat('dd-MM-yyyy').format(_dateTime)),
                RaisedButton(
                    child: Text("pickdate"),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(enddate.year + 1))
                          .then((value) {
                        setState(() {
                          _dateTime = value!;
                          pickeddate =
                              DateFormat('dd-MM-yyyy').format(_dateTime);
                        });
                      });
                    })
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
}
