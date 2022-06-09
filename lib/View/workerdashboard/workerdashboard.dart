import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/Watermark.dart';
import 'package:teamfix/constants/appbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/workerdashboard/dashboardBody.dart';

class Workerdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      floatingActionButton: Floatingbutton(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            child: Watermark(),
          ),
          Dashboardbody(),
        ],
      ),
      drawer: Workerdrawer(),
    );
  }
}
