import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:teamfix/View/checkwarrantystate/warranty.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/View/maintinanceinquiry/Maintinanceinquiry.dart';
import 'package:teamfix/View/notificaton/notification.dart';
import 'package:teamfix/View/respite/respite.dart';
import 'package:teamfix/View/vicationrequest/Vicationrequest.dart';

class Floatingbutton extends StatelessWidget {
  const Floatingbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: kprimarycolor,

      //  foregroundColor: backgroundcolor.withOpacity(0.25),
      animatedIcon: AnimatedIcons.menu_close,
      foregroundColor: kbackground,
    
      children: [
        SpeedDialChild(
          onTap: () => Get.to(Respite()),
          child: Icon(
            Icons.transfer_within_a_station_rounded,
            color: kbackground,
          ),
          backgroundColor: ksecondrycolor,
        ),
        SpeedDialChild(
          onTap: (() => Get.to(MyyNotification())),
          child: Icon(
            Icons.notifications,
            color: kbackground,
          ),
          backgroundColor: ksecondrycolor,
        ),
        SpeedDialChild(
          //label: "asds",
          labelStyle: TextStyle(),
          onTap: (() => Get.to(Vicationrequest())),
          child: Icon(
            Icons.sick_rounded,
            color: kbackground,
          ),
          backgroundColor: ksecondrycolor,
        ),
        SpeedDialChild(
          onTap: (() => Get.to(Maintinanceinquiry())),
          child: Icon(
            Icons.monetization_on_sharp,
            color: kbackground,
          ),
          backgroundColor: ksecondrycolor,
        ),
        SpeedDialChild(
          onTap: (() => Get.to(warranty())),
          labelStyle: TextStyle(),
          child: Icon(
            Icons.qr_code,
            color: kbackground,
          ),
          backgroundColor: ksecondrycolor,
        ),
      ],
    );
  }
}
