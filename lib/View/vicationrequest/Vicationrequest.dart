import 'package:flutter/material.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/vicationrequest/Vicationrequestbody.dart';

class Vicationrequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      floatingActionButton: Floatingbutton(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Vicationrequestbody(),
      drawer: Workerdrawer(),
    );
  }
}
