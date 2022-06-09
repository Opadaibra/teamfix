import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/logout/Logutbody.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,

      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      body: Logoutbody(),
      drawer: Workerdrawer(),
      floatingActionButton: Floatingbutton(),
    );
  }
}
