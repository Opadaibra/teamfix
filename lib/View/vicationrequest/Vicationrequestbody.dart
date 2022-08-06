//dashboard BODY
// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Controller/linkapi.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
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
  final TextEditingController reason = new TextEditingController();
  var pickeddate;
  Apicaller apicaller = new Apicaller();
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
                    controller: reason,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.notes),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "vacationorder")),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
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
                        }),
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(enddate.year + 1))
                              .then((value) {
                            setState(() {
                              _dateTime = value!;
                              pickeddate =
                                  DateFormat('yyyy-MM-dd').format(_dateTime);
                            });
                          });
                        },
                        child: Text(
                          DateFormat('dd-MM-yyyy').format(_dateTime),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    )
                  ],
                )
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
        onPressed: takevacation,
      ),
    );
   }
  // requeststate() async {
  //   var respone = await 
  // }

  takevacation() async {
    var respone = await apicaller.postrequest(vacationlink,
        {"worker_id": "$workerid", "reason": reason.text, "date": pickeddate});
    print(respone);
    print("Asdsf");
    try {
      if (respone['message'] == "yes") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en"
                ? "request has been approvin"
                : "تم قبول الطلب بنجاح 👍",
            style: TextStyle(fontSize: 12),
          ),
        ));
      } else if (respone['message'] == 'no') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en" ? "request has been denied" : "تم رفض الطلب ",
            style: TextStyle(fontSize: 12),
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en"
                ? "request has not been send"
                : "لم يتم إرسال الطلب  ",
            style: TextStyle(fontSize: 12),
          ),
        ));
      }
    } catch (e) {}
  }
}
