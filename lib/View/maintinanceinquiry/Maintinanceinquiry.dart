import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/maintinanceinquiry/Maintinanceinquirybody.dart';

class Maintinanceinquiry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      floatingActionButton: Floatingbutton(),
      body: Maintinanceinquirybody(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: Workerdrawer(),
    );
  }
}
