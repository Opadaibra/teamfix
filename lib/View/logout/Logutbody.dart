//dashboard BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamfix/View/LogIn/LoginPage.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';

class Logoutbody extends StatefulWidget {
  @override
  _LogoutbodyState createState() => _LogoutbodyState();
}

class _LogoutbodyState extends State<Logoutbody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.logout,
              color: kbackground,
              size: Get.width * 0.1,
            ),
            localeText: LocaleText("logout", style: Headlinestyle)),
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
            decoration: kboxdecoration,
            margin: defaultmargin,
            padding: defaultmargin,
            child: Column(
              children: [
                Verticaldefaultpadding,
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
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        hintText: Locales.string(context, "exit")),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Verticaldefaultpadding,
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
      //alignment: Alignment.center,
      margin: buttonmargen,

      decoration: sendbuttondecoration,
      child: ElevatedButton(
        style: buttonStyle,
        child: LocaleText(
          "logoutbut",
          style: draweritemstyle,
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setBool("loggedin", false);
          Get.off(LoginPage());
        },
      ),
    );
  }
}
