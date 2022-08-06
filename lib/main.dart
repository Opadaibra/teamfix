//@dart = 2.9
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teamfix/Settings/Localcontroller.dart';
import 'package:teamfix/View/LogIn//LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:teamfix/View/workerdashboard/workerdashboard.dart';

bool darkmood = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Locales.init(['en', 'ar']);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loginState = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogeinstate();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(Mylocalcontroller());
    SystemChrome.setEnabledSystemUIOverlays([]);
    ThemeData lighttheme = ThemeData(
      shadowColor: Colors.grey[200],
      primarySwatch: Colors.grey,
      primaryColor: Color(0xFF37506c),
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      accentColor: Color(0xffff715b),
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );
    ThemeData darktheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Color(0xFF37506c),
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Color(0xffff715b),
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
    );
    return LocaleBuilder(
      builder: (locale) => GetMaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        title: 'Worker',
        theme: darkmood ? darktheme : lighttheme,
        home: loginState ? Workerdashboard() : LoginPage(),
      ),
    );
  }

  checklogeinstate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      // pref.setDouble("appbarheight", size.height);
      loginState = pref.getBool("loggedin");
    });
  }
}
