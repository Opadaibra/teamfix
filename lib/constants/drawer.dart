import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/View/Endmaintenance/Endamaintenance.dart';
import 'package:teamfix/Settings/Settings.dart';
import 'package:teamfix/View/LogIn/LoginPage.dart';
import 'package:teamfix/View/checkwarrantystate/warranty.dart';
import 'package:teamfix/View/logout/logout.dart';
import 'package:teamfix/View/maintinanceinquiry/Maintinanceinquiry.dart';
import 'package:teamfix/View/notificaton/notification.dart';
import 'package:teamfix/View/respite/respite.dart';
import 'package:teamfix/View/showreq/showreq.dart';
import 'package:teamfix/View/vicationrequest/Vicationrequest.dart';
import 'package:teamfix/View/workerdashboard/workerdashboard.dart';
import 'package:teamfix/constants/constant.dart';

class Workerdrawer extends StatefulWidget {
  const Workerdrawer({
    Key? key,
  }) : super(key: key);
  @override
  WorkerdrawerState createState() => WorkerdrawerState();
}

class WorkerdrawerState extends State<Workerdrawer> {
  final TextEditingController _logoutcontroller = new TextEditingController();
  String errormessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.size.width * 0.80,
        child: ClipRRect(
          borderRadius: Locales.lang == "ar"
              ? BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      bottomEnd: Radius.circular(30))
                  .resolve(TextDirection.rtl)
              : BorderRadiusDirectional.only(
                      topEnd: Radius.circular(30),
                      bottomEnd: Radius.circular(30))
                  .resolve(TextDirection.ltr),
          child: Drawer(
            elevation: 40,
            child: Container(
              color: kprimarycolor,
              child: Column(
                children: [
                  useraccountheader(context),
                  // notiticationListtitle(context),
                  showmissions(context),
                  //checkWarrantyestate(context),
                  finishmaintnancerequest(context),
                  //maintinanceinquiry(context),
                  showrequest(context),
                  // vicationrequest(context),
                  // respite(context),
                  settings(context),
                  logout(context),
                ],
              ),
            ),
          ),
        ));
  }

  ListTile notiticationListtitle(BuildContext context) {
    return ListTile(
        title: LocaleText(
          "notifi",
          textAlign: TextAlign.start,
          style: draweritemstyle,
        ),
        leading: Icon(
          Icons.notifications,
          color: kbackground,
        ),
        onTap: () {
          Scaffold.of(context).closeDrawer();

          Get.to(MyyNotification());
        });
  }

  ListTile showmissions(BuildContext context) {
    return ListTile(
      title: LocaleText(
        "mainmenu",
        textAlign: TextAlign.start,
        style: draweritemstyle,
      ),
      leading: Icon(
        Icons.auto_awesome_motion_outlined,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();
        Get.to(Workerdashboard());
      },
    );
  }

  ListTile checkWarrantyestate(BuildContext context) {
    return ListTile(
      title: LocaleText("warranty",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.qr_code,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new warranty()));
      },
    );
  }

  ListTile finishmaintnancerequest(BuildContext context) {
    return ListTile(
      title: LocaleText("endmainreq",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.add_task,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();
        Get.to(Endamaintenance());
      },
    );
  }

  ListTile maintinanceinquiry(BuildContext context) {
    return ListTile(
      title: LocaleText("inquir",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.precision_manufacturing_rounded,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Maintinanceinquiry()));
      },
    );
  }

  ListTile vicationrequest(BuildContext context) {
    return ListTile(
      title: LocaleText("vacation",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.sick_rounded,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new Vicationrequest()));
      },
    );
  }

  ListTile showrequest(BuildContext context) {
    return ListTile(
      title: LocaleText("showreq",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.view_stream,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new Showreq()));
      },
    );
  }

  ListTile respite(BuildContext context) {
    return ListTile(
      title: LocaleText("postpon",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.transfer_within_a_station_rounded,
        color: kbackground,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();

        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Respite()));
      },
    );
  }

  ListTile settings(BuildContext context) {
    return ListTile(
        title: LocaleText("settings",
            textAlign: TextAlign.start, style: draweritemstyle),
        leading: Icon(
          Icons.settings,
          color: kbackground,
        ),
        onTap: () {
          Scaffold.of(context).closeDrawer();
          Get.to(Settings());
        });
  }

  ListTile logout(BuildContext context) {
    return ListTile(
      title: LocaleText("logout",
          textAlign: TextAlign.start, style: draweritemstyle),
      leading: Icon(
        Icons.logout_rounded,
        color: kbackground,
      ),
      onTap: () {
        //  Scaffold.of(context).closeDrawer();
        Get.defaultDialog(
          content: Column(
            children: [
              Text(errormessage),
              Container(
                alignment: Alignment.center,
                //    width: size.width * 0.9,
                child: TextField(
                  textAlign: TextAlign.start,
                  minLines: 1,
                  maxLines: 5,
                  controller: _logoutcontroller,
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.notes),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      hintText: Locales.string(context, "exit")),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
          cancel: InkWell(
            onTap: () => Get.back(),
            child: LocaleText(
              "cancel",
              style: dialogbuttonstyle,
            ),
          ),
          confirm: ElevatedButton(
            onPressed: () {
              if (_logoutcontroller.text.isEmpty) {
                setState(() {
                  errormessage = "Please fill cause field first ";
                });
              } else {
                Get.off(LoginPage());
              }
            },
            child: LocaleText(
              "confirm",
              style: dialogbuttonstyle,
            ),
          ),
        );

        //  Get.to(Logout());
      },
    );
  }

  UserAccountsDrawerHeader useraccountheader(BuildContext context) {
    return UserAccountsDrawerHeader(
      //currentAccountPictureSize: size * 0.18,
      currentAccountPicture: CircleAvatar(
        backgroundColor: kbackground,
      ),
      accountName:
          Text("OpadaIbra", textAlign: TextAlign.left, style: draweritemstyle),
      accountEmail: Text("Opadaibra@gmail.com",
          textAlign: TextAlign.left, style: draweritemstyle),
    );
  }
}
