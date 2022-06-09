import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/constants/constant.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({Key? key})
      : preferredSize = Size.fromHeight(Get.height * 0.16),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Image.asset(
      //   whitGetFix,
      //   width: Get.size.width * 0.6,
      // ),
      title: Column(
        children: [
          Image.asset(
            whitGetFix,
            width: Get.size.width * 0.6,
          ),
          Container(
            width: Get.width * 0.4,
            height: Get.height * 0.04,
            decoration: BoxDecoration(
                border: Border.all(color: ksecondrycolor),
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(kdefaultradius),
                  right: Radius.circular(kdefaultradius),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LocaleText(
                  "id",
                  style: Headlinestyle,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Text(
                  "10",
                  style: Headlinestyle,
                ),
              ],
            ),
          ),
        ],
      ),

      centerTitle: true,
      backgroundColor: kprimarycolor,
      toolbarHeight: Get.size.height * 0.15,
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }
}
