//LOGIN BODY

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:teamfix/Controller/linkapi.dart';

import 'package:teamfix/Controller/Apicaller.dart';
import 'package:teamfix/Mywidgits/MainAppBar.dart';
import 'package:teamfix/View/workerdashboard/workerdashboard.dart';

import 'package:teamfix/constants/constant.dart';

bool loginpressed = false;
int workerid = 0;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Apicaller apicaller = new Apicaller();
  Text usernamehint = LocaleText("username");
  Text passwordhint = LocaleText("pasword");
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String msgStatus = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //    alignment: Alignment.center,
        child: SingleChildScrollView(
      child: Column(
        children: [
          padding2(Get.size, 0.08),
          topImage(Get.size),
          padding2(Get.size, 0.03),
          middlebox(Get.size),
          padding2(Get.size, 0.03),

          // creataccount(size)
        ],
      ),
    ));
  }

  Padding padding2(Size size, double decreasrate) =>
      Padding(padding: EdgeInsets.only(top: size.height * decreasrate));
/*
  Container creataccount(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.05),
      width: size.width * 0.5,
      // ignore: deprecated_member_use
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ThemeData.light().backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: maincolor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          child: Text(
            'إنشاء حساب',
            style: textmanger().styleofText(false, 12, context),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {});
          }),
    );
  }
*/
  Container middlebox(Size size) {
    return middleboxoutline(size);
  }

  Container middleboxoutline(Size size) {
    return Container(
      width: size.width * 0.80,
      height: size.height * 0.60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            //    color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            color: kdefaultshadow,
            offset: Offset(0, 20), // changes position of shadow
          ),
        ],
        color: kbackground,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: middleboxentites(size),
    );
  }

  Column middleboxentites(Size size) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        LocaleText(
          "sign",
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: kprimarycolor,
                fontWeight: FontWeight.bold,
              ),
          //  textAlign: TextAlign.center,
        ),
        // Padding(padding: EdgeInsets.all(size.height * 0.02)),
        Padding(padding: EdgeInsets.symmetric(vertical: 30)),
        email(size),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)), password(size),
        Verticaldefaultpadding,
        signinbutton(size),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Container(
          height: size.height * 0.03,
          child: Text(
            '$msgStatus',
            textAlign: TextAlign.center,
            style: TextStyle(color: kerror, fontWeight: FontWeight.bold),
          ),
        ),
        forgotpassword(size),
        //singinthrow(),
        // Padding(padding: EdgeInsets.all(size.height * 0.01)),
        //changesigninmethod(size),
        //Padding(padding: EdgeInsets.all(size.height * 0.01)),
      ],
    );
  }

  // ignore: deprecated_member_use
  FlatButton forgotpassword(Size size) {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: null,
      child: LocaleText("forgotpassword",
          style: TextStyle(color: kprimarycolor, fontSize: 12)),
    );
  }

  Container changesigninmethod(Size size) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: null,
            child: Icon(
              Icons.email,
              size: size.width * 0.1,
              color: Colors.red[400],
            ),
          ),
          // ignore: deprecated_member_use
          FlatButton(
              onPressed: null,
              child: Icon(
                Icons.facebook,
                size: size.width * 0.1,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  Container signinbutton(Size size) {
    return Container(
      width: size.width * 0.5,
      height: Get.height * 0.06,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ksecondrycolor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: kbackground,
                width: .5,
              ),
            ),
          ),
        ),
        child: loginpressed
            ? CircularProgressIndicator(
                color: kbackground,
              )
            : LocaleText(
                "sign",
                style: TextStyle(color: kbackground, fontSize: 14),
              ),
        onPressed: () {
          sign();
        },
        onLongPress: () {
          Get.off(Workerdashboard());
        },
      ),
    );
  }

  checkfiled() {
    if (_passwordController.text.isEmpty || _emailController.text.isEmpty) {
      return false;
    }
    return true;
  }

  sign() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("asdsa");
    if (checkfiled()) {
      setState(() {
        loginpressed = true;
      });
      var response = await apicaller.postrequest(Loginlink, {
        "username": _emailController.text,
        "password": _passwordController.text,
      });
      print(response);
      try {
        if (response['message'] == "sucess") {
          setState(() {
            loginpressed = false;
            workerid = response['WorkerId'];
            try {
              workershipid = response['WorkShop'];
              preferences.setInt("WorkShop", workershipid);
            } catch (e) {}
            preferences.setInt("WorkerId", workerid);
          });
          Get.off(Workerdashboard());
        } else if (response["message"] == 'Invalid') {
          setState(() {
            loginpressed = false;
          });
          msgStatus = "Wrong email or password";
        }
      } catch (e) {
        setState(() {
          loginpressed = false;
          msgStatus = "check your internet connection";
        });
      }
    } else {
      setState(() {
        msgStatus = "قم بتعئبة جميع الحقول ";
      });
    }
  }

  Container password(Size size) {
    return Container(
      width: size.width * 0.70,
      child: TextField(
        controller: _passwordController,
        textAlign: TextAlign.start,
        autocorrect: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[80],
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            prefixIcon: Icon(
              Icons.vpn_key,
              color: ksecondrycolor,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 2.0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 2.0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            hintText: Locales.string(context, "enterpass"),
            hintStyle: khintstyle),
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }

  Container email(Size size) {
    return Container(
      width: size.width * 0.70,
      //height: size.height * 0.06,
      child: TextField(
        // expands: true,
        controller: _emailController,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[80],
            contentPadding: const EdgeInsets.symmetric(vertical: 0),
            prefixIcon: Icon(Icons.person, color: ksecondrycolor),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(
                width: 0,
                color: kbackground,
                //style: BorderStyle.solid
              ),
              borderRadius: new BorderRadius.all(Radius.circular(120)),
            ),
            hintText: Locales.string(context, "enterusername"),
            hintStyle: khintstyle

            // icon: Icon(Icons.person),
            ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Container topImage(Size size) {
    return Container(
      margin: defaultmargin,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 25, color: kdefaultshadow, offset: Offset(0, 20))
      ]),
      child: Image.asset(
        "Images/GetFix.png",
        width: size.width,
        alignment: Alignment.center,
      ),
    );
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
