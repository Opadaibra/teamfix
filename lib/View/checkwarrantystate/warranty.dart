import 'package:flutter/material.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';

import 'package:teamfix/Mywidgits/MainAppBar.dart';

import 'package:teamfix/View/checkwarrantystate/warrantystatebody.dart';
import 'package:teamfix/constants/constant.dart';

import 'package:teamfix/constants/drawer.dart';

class warranty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color backgroundcolor = kbackground;
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: warrantystatebody(),
      drawer: Workerdrawer(),
      floatingActionButton: Floatingbutton(),
    );
  }
}
