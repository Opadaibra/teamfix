//Sign BODY

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/constants/Manger.dart';
import 'package:teamfix/View/workerdashboard/workerdashboard.dart';
import 'package:teamfix/constants/constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Apicaller databaseHelper = new Apicaller();

  final TextEditingController pincontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Padding padding2(Size size, double decreasrate) =>
        Padding(padding: EdgeInsets.only(top: size.height * decreasrate));
    return Container(
        //alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            vertical: Get.width * 0.05, horizontal: Get.height * 0.002),
        child: SingleChildScrollView(
          child: Column(
            children: [
              padding2(Get.size, 0.01),
              topImage(Get.size),
              padding2(Get.size, 0.1),
              middilentity(Get.size),
              padding2(Get.size, 0.08),
              downbutton(Get.size)
            ],
          ),
        ));
  }

  Container middilentity(Size size) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              child: Image.asset(
            "Images/codebackground.png",
            width: double.infinity,
            scale: size.width * 0.001,
          )),
          Container(
              alignment: Alignment.center,
              width: size.width * 0.70,
              height: size.height * 0.06,
              child: PinInputTextFormField(
                pinLength: 4,
                controller: pincontroller,
                decoration: BoxLooseDecoration(
                    strokeWidth: 3,
                    strokeColorBuilder: PinListenColorBuilder(
                      Color(0xFF37506c),
                      Colors.white,
                    ),
                    textStyle: TextStyle(color: kprimarycolor, fontSize: 20)),
                onSubmit: (String pin) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'pin',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: kprimarycolor, fontSize: 20),
                          ),
                          content: Text('your pin is $pin'),
                        );
                      });
                },
              )
              /*TextField(
              //  controller: _passwordController,
              textAlign: TextAlign.center,

              decoration: InputDecoration(
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(
                    width: 2.0,
                    color: Colors.white,
                    //style: BorderStyle.solid
                  ),
                  borderRadius: new BorderRadius.all(Radius.circular(120)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: new BorderSide(
                    width: 2.0,
                    color: Colors.black,
                    //style: BorderStyle.solid
                  ),
                  borderRadius: new BorderRadius.all(Radius.circular(120)),
                ),

                hintText: "رقم التعريف",
                hintStyle: hidline4textStyle,

                // icon: Icon(Icons.person),
              ),
              cursorColor: Colors.white,

              style: buttontext,

              keyboardType: TextInputType.visiblePassword,
            ),*/
              )
        ],
      ),
    );
  }

  Container topImage(Size size) {
    return Container(
      child: Image.asset("Images/GetFix.png",
          width: size.width,
          alignment: Alignment.center,
          filterQuality: FilterQuality.high),
    );
  }

  Container downbutton(Size size) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        Get.off(Workerdashboard());
      },
      color: Color(0xFF37506c),
      textColor: Colors.white,
      child: Icon(
        Icons.arrow_forward_rounded,
        size: size.width * 0.1,
      ),
      padding: EdgeInsets.all(16),
      shape: CircleBorder(),
    ));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Failed'),
            content: new Text('Check your email or password'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new RaisedButton(
                child: new Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
