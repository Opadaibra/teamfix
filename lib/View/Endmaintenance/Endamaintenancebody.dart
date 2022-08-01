//dashboard BODY
import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:multiselect/multiselect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Controller/linkapi.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/constant.dart';

class Endamaintenancebody extends StatefulWidget {
  @override
  _EndamaintenancebodyState createState() => _EndamaintenancebodyState();
}

class _EndamaintenancebodyState extends State<Endamaintenancebody> {
  final TextEditingController _requestnumber = new TextEditingController();
  final TextEditingController _consumingkit = new TextEditingController();
  final TextEditingController _repaires = new TextEditingController();
  final TextEditingController _totalcost = new TextEditingController();
  final TextEditingController _notes = new TextEditingController();
  ScanResult? scanResult;
  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');
  var _aspectTolerance = 1.00;
  var _selectedCamera = 1;
  var _autoEnableFlash = false;
  int myid = 0;
  @override
  void initState() {
    // TODO: implement initState
    getid();
  }

  getid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getInt("id") != null) {
      myid = pref.getInt("id")!;
    }
  }

  List _machin = ["refregator", "aircondition", "wachmachin"];
  var _selectedmachin;
  List<String> option = ["engine", "bilt", "gaz"];
  List<String> selectedoption = [];
  Apicaller apicaller = new Apicaller();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        modiefedappbar(
            size: Get.size,
            widgiticon: Icon(
              Icons.add_task,
              color: kbackground,
              size: Get.width * 0.1,
            ),
            localeText: LocaleText("endmaintenance", style: Headlinestyle)),
        Verticaldefaultpadding,
        body(context, Get.size),
      ],
    );
  }

  fillkitlist() async {
    final queryParameters = {
      'machin': _selectedmachin,
    };
    final uri = Uri.https('al-hafez.herokuapp.com', '/api/', queryParameters);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    print(response);
  }

  Expanded body(BuildContext context, Size size) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: defaultmargin,
            padding: defaultmargin,
            decoration: kboxdecoration,
            child: Column(
              children: [
                Verticaldefaultpadding,
                barcodebutton(size, context),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                    alignment: Alignment.center,
                    width: size.width * 0.9,
                    height: size.height * 0.05,
                    child: DropDownMultiSelect(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                              width: 0.5,
                              color: Colors.grey,
                              //style: BorderStyle.solid
                            ),
                            borderRadius:
                                new BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        options: option,
                        whenEmpty: "please select kits",
                        hintStyle: TextStyle(color: kprimarycolor),
                        selectedValues: selectedoption,
                        onChanged: (Value) {
                          selectedoption = Value;
                          setState(() {
                            print(Value);
                          });
                        })),

                // ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Container(
                  alignment: AlignmentDirectional.center,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: _requestnumber,
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.format_list_numbered),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "reqno")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: _repaires,
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.home_repair_service_rounded),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "repair")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: _totalcost,
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.attach_money_sharp),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "tocost")),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: size.width * 0.9,
                  child: TextField(
                    controller: _notes,
                    textAlign: TextAlign.start,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.notes),
                        hintStyle: khintstyle,
                        hintText: Locales.string(context, "notes")),
                    textInputAction: TextInputAction.done,
                  ),
                ),

                Verticaldefaultpadding
              ],
            ),
          ),
          Verticaldefaultpadding,
          sendbutton(size, context)
        ],
      ),
    );
  }

  Container barcodebutton(Size size, BuildContext context) {
    return Container(
      //   margin: EdgeInsets.symmetric(horizontal: 42),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      height: size.height * .08,
      child: ListTile(
        leading: Text(
          scanResult == null ? "يرجى مسح الباركود" : "✅ تم المسح ",
          style: TextStyle(color: kprimarycolor, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        trailing: IconButton(
            icon: Icon(
              Icons.qr_code,
              color: kprimarycolor,
            ),
            onPressed: _scan),
      ),
    );
  }

  sendserialnumber() async {
    try {
      var respone = await apicaller.postrequest(
          sendserial, {"serial": scanResult!.rawContent.toString()});
      print(respone);
      // option.clear();
      // for (int i = 0; i < respone.length; i++) {
      //   option.add(respone[i]["error_type"]);
      // }
    } catch (e) {
      print(" scan qr erroe: $e");
    }
  }

  Container sendbutton(Size size, BuildContext context) {
    return Container(
      margin: buttonmargen,
      decoration: sendbuttondecoration,
      child: ElevatedButton(
        style: buttonStyle,
        child: buttontext,
        onPressed: finishmaintenance,
      ),
    );
  }

  bool checkinput() {
    if (_requestnumber.text.isEmpty ||
        _consumingkit.text.isEmpty ||
        _repaires.text.isEmpty ||
        _totalcost.text.isEmpty ||
        _notes.text.isEmpty) {
      return false;
    }
    return true;
  }

  finishmaintenance() async {
    if (checkinput()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: kprimarycolor,
        duration: Duration(seconds: 2),
        content: Text(
          Locales.lang == "en"
              ? "please fill all field "
              : "الرجاء ملئ جميع الحقول",
          style: TextStyle(fontSize: 12),
        ),
      ));
    } else {
      var respone = await apicaller.postrequest(finishlink, {
        "id": "$myid",
        "no": _requestnumber.text,
        "consumingkit": _consumingkit,
        "repairs": _repaires,
        "totalcost": _totalcost,
        "notes": _notes
      });
      if (respone == "sucess") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en"
                ? "Manintenance has been End successfully👍"
                : "تم إنهاء الصيانة بنجاح 👍",
            style: TextStyle(fontSize: 12),
          ),
        ));
      } else if (respone == "failed") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: kprimarycolor,
          duration: Duration(seconds: 2),
          content: Text(
            Locales.lang == "en" ? "request denied " : "تم رفض الطلب",
            style: TextStyle(fontSize: 12),
          ),
        ));
      }
    }
  }

  Row header(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: size.width * 0.99,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                color: ksecondrycolor, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsetsDirectional.only(start: size.width * 0.04),
            alignment: Alignment.center,
            child: LocaleText('send',
                textAlign: TextAlign.center,
                style: TextStyle(color: kbackground, fontSize: 16))),
      ],
    );
  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': _cancelController.text,
            'flash_on': _flashOnController.text,
            'flash_off': _flashOffController.text,
          },
          useCamera: -1,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: true,
          ),
        ),
      );

      setState(() => scanResult = result);
      if (scanResult != null) {
        print(scanResult!.rawContent.toString());
        sendserialnumber();
      }
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.qr,
          // format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
