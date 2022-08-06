//dashboard BODY

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Controller/linkapi.dart';
import 'package:teamfix/Mywidgits/modifedappbar.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/constants/constant.dart';

class warrantystatebody extends StatefulWidget {
  @override
  _warrantystatebodyState createState() => _warrantystatebodyState();
}

class _warrantystatebodyState extends State<warrantystatebody> {
  ScanResult? scanResult;
  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'Cancel');
  var _aspectTolerance = 1.00;
  var _selectedCamera = 1;
  var _autoEnableFlash = false;
  String qr = "";
  String messsagewarrnty = "";
  Apicaller apicaller = new Apicaller();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            modiefedappbar(
                size: Get.size,
                widgiticon: Icon(
                  Icons.qr_code,
                  color: kbackground,
                  size: Get.size.width * 0.1,
                ),
                localeText: LocaleText("warranty", style: Headlinestyle)),
            Verticaldefaultpadding,
            Container(
              alignment: Alignment.center,
              width: Get.width * 0.75,
              child: LocaleText('barcph',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kprimarycolor, fontSize: 18)),
            ),
            Container(
                alignment: AlignmentDirectional.bottomCenter,
                child: IconButton(
                    iconSize: Get.width * 0.5,
                    onPressed: _scan,
                    icon: Icon(
                      Icons.qr_code_scanner_outlined,
                      color: ksecondrycolor,
                      //  size: 200,
                      //size: size.width * 0.5,
                    ))),
            Text(messsagewarrnty),
            //sendbutton(size, context)
          ],
        ),
      ),
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
        var respon = await apicaller.postrequest(
            checkwarranty, {"syr_num": scanResult!.rawContent.toString()});
        print(respon);
        if (respon['message'] == "True") {
          setState(() {
            messsagewarrnty = Locales.string(context, "iswarranty");
          });
        } else {
          setState(() {
            messsagewarrnty = Locales.string(context, "isnotwarranty");
          });
        }
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

  Row sendbutton(Size size, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: size.width * 0.2,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kprimarycolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: kprimarycolor,
                    width: .5,
                  ),
                ),
              ),
            ),
            child: LocaleText(
              "send",
              style: TextStyle(color: kprimarycolor, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
        )
      ],
    );
  }

  Padding padding2(Size size, double decrease) =>
      Padding(padding: EdgeInsets.only(top: size.height * decrease));
}
