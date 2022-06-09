import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/constants/Watermark.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/notificaton/notificatinbody.dart';

class MyyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);

    return Scaffold(
      drawer: Workerdrawer(),
      floatingActionButton: Floatingbutton(),

      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: AppBar(
          backgroundColor: kprimarycolor,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: size.height * 0.1,
          title: LocaleText("notifi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: kbackground, fontWeight: FontWeight.bold))),
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Notificatinbody(),
        ],
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
    );
  }
}
