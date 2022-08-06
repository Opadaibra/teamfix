//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Controller/linkapi.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';

int myid = 0;

class Respitebody extends StatefulWidget {
  @override
  _RespitebodyState createState() => _RespitebodyState();
}

class _RespitebodyState extends State<Respitebody> {
  TextEditingController _requestnumber = new TextEditingController();
  TextEditingController _reason = new TextEditingController();
  TextEditingController _meornot = new TextEditingController();
  Apicaller _apicaller = new Apicaller();

  bool check1value = false;
  bool check2value = false;
  @override
  // ignore: must_call_super
  void initState() {
    getid();
  }

  getid() async {
    print(workerid);
    print(workershipid);
  }

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
                    controller: _requestnumber,
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
                  child: TextField(
                    controller: _reason,
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

                Container(
                  padding: defaultmargin,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(Locales.lang == 'ar' ? "لي" : "for me"),
                      Checkbox(
                          value: check1value,
                          onChanged: (Value) {
                            setState(() {
                              check1value = Value!;
                              check2value = !Value;
                              print(" to me :{$check1value}");
                              print("not to me :{$check2value}");
                            });
                          }),
                      Text(Locales.lang == 'ar' ? "لغيري" : "for other team"),
                      Checkbox(
                          value: check2value,
                          onChanged: (Value) {
                            setState(() {
                              check1value = !Value!;
                              check2value = Value;
                              print("not to me :{$check2value}");
                            });
                          })
                    ],
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
        onPressed: respitmaintenance,
      ),
    );
  }

  bool checkinput() {
    if (_requestnumber.text.isEmpty ||
        _reason.text.isEmpty ||
        _meornot.text.isEmpty) {
      return false;
    }
    return true;
  }

  respitmaintenance() async {
    if (checkinput()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kprimarycolor,
        duration: Duration(seconds: 2),
        content: Text(
          Locales.lang == "en"
              ? "please fill all field "
              : "الرجاء ملئ جميع الحقول",
          style: TextStyle(fontSize: 12),
        ),
      ));
    } else {
      var respone = await _apicaller.postrequest(respitlink, {
        "worker_id": "$workerid",
        "mission_id": "${_requestnumber.text}",
        "note_of_worker": _reason.text,
        "transfer": check1value ? "for me" : "for other team",
      });
      print("${_requestnumber.text}");
      print(respone);
      if (respone['message'] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en"
                ? "Manintenance has been respite successfully👍"
                : "تم إنهاء الصيانة بنجاح 👍",
            style: TextStyle(fontSize: 12),
          ),
        ));
      } else if (respone['message'] != "sucess") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            "${respone['message']}",
            style: TextStyle(fontSize: 12),
          ),
        ));
      }
    }
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
