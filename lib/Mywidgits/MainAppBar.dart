import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/constants/constant.dart';

int workerid = 0;

int workershipid = 0;

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
                color: kprimarycolor,
                // border: Border.all(color: ksecondrycolor),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 9, offset: Offset(0, -1), color: kbackground)
                ],
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
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
                  "$workershipid",
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
