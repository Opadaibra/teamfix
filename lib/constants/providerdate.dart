import 'package:flutter/material.dart';
import 'package:teamfix/main.dart';

class providerdata {
  ThemeData _themeData = darkmood ? ThemeData.dark() : ThemeData.light();

  getTheme() {
    return _themeData;
  }

  setTheme(ThemeData themeData) {
    this._themeData = themeData;
  }
}
