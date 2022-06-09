import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/constants/appbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/constants/drawer.dart';
import 'package:teamfix/View/showreq/showreqbody.dart';

class Showreq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      appBar: MainAppBar(),
      floatingActionButton: Floatingbutton(),
      body: Showreqbody(),
      drawer: Workerdrawer(),
    );
  }
}
