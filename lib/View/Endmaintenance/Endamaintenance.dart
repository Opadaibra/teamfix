import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamfix/View/Endmaintenance/Endamaintenancebody.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/Watermark.dart';
import 'package:teamfix/constants/appbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';

class Endamaintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      body: Endamaintenancebody(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: Workerdrawer(),
      floatingActionButton: Floatingbutton(),
    );
  }
}
