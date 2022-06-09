import 'package:flutter/material.dart';
import 'package:teamfix/Mywidgits/Floatingbutton.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/View/respite/respitebody.dart';
import 'package:teamfix/constants/drawer.dart';

class Respite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*MainAppBar(),.Appbarwigit(context),*/
      appBar: MainAppBar(),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Respitebody(),
      drawer: Workerdrawer(),
      floatingActionButton: Floatingbutton(),
    );
  }
}

///كنت عم اقلب اللون ل ك برايمري 
///وبدي اقلب ستايل التسكس فيلد 
///وبدي ازبط ترويسة كل تطبيق
///وبدي ازبط الفلوت بوتون بالتطبيقين وخليها بكللل الواجهات 
///وبدي ارجع الستنغ لشكلها  الاصلي 
///وكل هاد بمشسيئة الله
///بدك تزبط الدراور تكب البارمتر