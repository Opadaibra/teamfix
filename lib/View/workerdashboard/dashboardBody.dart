//Sign BODY

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Controller/linkapi.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/appbar.dart';
import 'package:teamfix/constants/constant.dart';
import 'package:teamfix/main.dart';

class Dashboardbody extends StatefulWidget {
  @override
  _DashboardbodyState createState() => _DashboardbodyState();
}

class _DashboardbodyState extends State<Dashboardbody>
    with WidgetsBindingObserver {
  double totaltask = 10;
  double finishtask = 7;
  double estimatedtask = 3;
  Timer? timer;
  String openlocationmessge = "";
  late AppLifecycleState _notification;
  Apicaller apicaller = new Apicaller();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final isbackground = state == AppLifecycleState.paused;
  }

  loggedin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("loggedin", true);
  }

  @override
  void initState() {
    super.initState();
    loggedin();
    Future.delayed(Duration(seconds: 4), () {
      print("now");
    });

    Future.delayed(Duration(seconds: 4), () {
      getid();
    });

    //getappbar();
    WidgetsBinding.instance.addObserver(this);
    timer = Timer.periodic(
        Duration(seconds: 30), (Timer t) => getcurrentlocation());
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  String altitude = "";
  String longtiud = "";
  double totalmission = 10;
  late double restmission;
  double donemission = 5;
  var locationmessag = "";
  void getcurrentlocation() async {
    var posation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastposation = await Geolocator().getLastKnownPosition();
    print(lastposation);
    // ignore: unused_element
    initState() {
      //   getmission();
    }

    setState(() {
      locationmessag = "${posation.altitude}, ${posation.longitude}";
      altitude = "${posation.altitude}";
      longtiud = "${posation.longitude}";
    });
    sendlocation(altitude, longtiud);
  }

  sendlocation(String x, String y) async {
    var respone = await apicaller.postrequest(locationkink, {"x": x, "y": y});
    print(respone);
    try {
      if (respone['message'] == "success") {}
    } catch (e) {
      setState(() {
        openlocationmessge = "Please open location";
      });
    }
  }

  void getmission() async {
    final queryParameters = {
      'workedid': workerid,
    };
    final uri = Uri.https('al-hafez.herokuapp.com', '/api/', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    var responebody = jsonDecode(response.body);
    print(responebody);
    setState(() {
      finishtask = responebody['finished'];
      totaltask = responebody['total'];
      estimatedtask = totaltask - finishtask;
    });
  }

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      color: kprimarycolor,
      thickness: 2,
      height: 10,
    );
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            modiefedappbar(
                size: Get.size,
                widgiticon: Icon(
                  Icons.home,
                  color: kbackground,
                  size: Get.size.width * 0.1,
                ),
                localeText: LocaleText("mainmenu", style: Headlinestyle)),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Text(openlocationmessge),
            // percentageheadline(Get.size, context),
            Container(
                width: Get.width,
                margin: defaultmargin,
                padding: EdgeInsets.symmetric(vertical: kdefaultpadding),
                decoration: kboxdecoration,
                child: circularpercent(context, Get.size)),
            // Manger().sizedBox(0, 0.02, context),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Stack(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                Transform.translate(
                  offset: Offset(0, 15),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: kboxdecoration,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                        // Manger().sizedBox(0, 0.01, context),
                        analysis(context, Get.size, "numoftotalmission",
                            totaltask.toInt()),
                        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                        //Manger().sizedBox(0, 0.01, context),
                        //divider,
                        analysis(context, Get.size, "accomplishmission",
                            finishtask.toInt()),
                        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                        //Manger().sizedBox(0, 0.01, context),
                        analysis(context, Get.size, "estimatedmission",
                            totaltask.toInt() - finishtask.toInt()),
                        Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                        Text(locationmessag)
                        // taskstate(Get.size, context),
                      ],
                    ),
                  ),
                ),
                taskstate(Get.size, context),
              ],
            ),

            //Manger().sizedBox(0, 0.02, context),
            //monthleytask(Get.size, context),
            //testlocation(size, context),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          ],
        ),
      ),
    );
  }

  Container percentageheadline(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.99,
      height: size.height * 0.04,
      decoration: BoxDecoration(
          color: ksecondrycolor, borderRadius: BorderRadius.circular(5)),
      alignment: AlignmentDirectional.center,
      child: LocaleText('percentageoftasks',
          style: TextStyle(
            color: kbackground,
          )),
    );
  }

  Container taskstate(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      height: size.height * 0.04,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: Offset(0, 10),
          color: kdefaultshadow,
        )
      ], color: kprimarycolor, borderRadius: BorderRadius.circular(18)),
      alignment: AlignmentDirectional.center,
      child: LocaleText('taskstats',
          style: TextStyle(
            color: kbackground,
          )),
    );
  }

  Container monthleytask(Size size, BuildContext context) {
    return Container(
      width: size.width * 0.99,
      height: size.height * 0.04,
      decoration: BoxDecoration(
          color: ksecondrycolor, borderRadius: BorderRadius.circular(5)),
      alignment: AlignmentDirectional.center,
      child: LocaleText('monthlymission',
          style: TextStyle(
            color: kbackground,
          )),
    );
  }

  Container circularpercent(BuildContext context, Size size) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 25, color: kdefaultshadow, offset: Offset(0, 20))
      ]),
      child: CircularPercentIndicator(
        radius: 150,
        lineWidth: 20,
        percent: (finishtask * totaltask / 100),
        progressColor: kprimarycolor,
        backgroundColor: ksecondrycolor,
        circularStrokeCap: CircularStrokeCap.round,
        center: Text('${(finishtask * totaltask / 100) * 100}%',
            style: TextStyle(color: ksecondrycolor, fontSize: 16)),
      ),
    );
  }

  Container analysis(
      BuildContext context, Size size, String localtext, int value) {
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 10),
            width: size.width * 0.7,
            height: size.height * 0.05,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 10,
                      color: kdefaultshadow,
                      offset: Offset(0, 20))
                ],
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16), top: Radius.circular(16)),
                color: kbackground),
            padding: EdgeInsetsDirectional.only(start: 20),
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: [
                LocaleText(localtext,
                    style: TextStyle(
                      color: kprimarycolor,
                    )),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
              width: size.width * 0.12,
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 10,
                        color: kdefaultshadow,
                        offset: Offset(0, 20))
                  ],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16), top: Radius.circular(16)),
                  color: kbackground),
              child: percent(context, size, value)),
        ],
      ),
    );
  }

  Container percent(BuildContext context, Size size, int value) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Text("$value",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ksecondrycolor,
          )),
    );
  }

  getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("WorkerId") != null)
      setState(() {
        workerid = pref.getInt("WorkerId")!;
      });
    else {
      print("asdgf");
    }
    if (pref.getInt("WorkShop") != null) {
      var shipid = pref.getInt("WorkShop")!;
      setState(() {
        workershipid = shipid;
      });
    } else {
      print("aasdsasdgf");
    }
    print("worker id is $workerid");
    print("workership id is $workershipid");
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
