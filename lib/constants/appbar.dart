import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:teamfix/constants/Manger.dart';

//Size size = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
late double appbarheight = 25;
void appbar() {
  print(2123123);
}

class dashboardappbar extends StatefulWidget implements PreferredSizeWidget {
  dashboardappbar({Key? key})
      : preferredSize = Size.fromHeight(200),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  State<dashboardappbar> createState() => _dashboardappbarState();
}

class _dashboardappbarState extends State<dashboardappbar> {
  @override
  void initState() {
    setState(() {
      print("1fsf");
      appbar();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Manger().getsize(context);
    return AppBar(
      elevation: size.width * 0.25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      //leadingWidth: 0,
      toolbarHeight: size.height * 0.25,
      automaticallyImplyLeading: true,
      //backgroundColor: Colors.black,
      leadingWidth: 30,
      title: Transform.translate(
        offset: Locales.lang == 'ar'
            ? Offset(-size.width * 0.02, 0)
            : Offset(size.width * -0.02, 0),
        //  alignment: AlignmentDirectional.topStart,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text('Cranes'),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: size.width * 0.05),
                  child: Image.asset(
                    'Images/whiteGetFix.png',
                    width: size.width * 0.7,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Locales.lang == 'ar'
                      ? Offset(-size.width * 0.02, 0)
                      : Offset(size.width * -0.05, 0),
                  child: Container(
                    margin: EdgeInsets.only(left: size.width * 0.05),
                    alignment: Alignment.center,
                    child: LocaleText(
                      'maintenanceteam',
                      textAlign: TextAlign.center,
                      style: Manger().styleofText(Colors.white, false,
                          size.width * 0.04, context, false),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Locales.lang == 'ar'
                      ? Offset(size.width * 0.02, 0)
                      : Offset(size.width * -0.05, 0),
                  child: Container(
                      margin: EdgeInsets.only(left: size.width * 0.05),
                      alignment: Alignment.center,
                      child: Icon(Icons.group)),
                ),
              ],
            ),
            Transform.translate(
              offset: Locales.lang == 'ar'
                  ? Offset(size.width * 0.02, 0)
                  : Offset(size.width * -0.02, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.05),
                    alignment: Alignment.center,
                    child: LocaleText(
                      'TeamID',
                      textAlign: TextAlign.center,
                      style: Manger().styleofText(Colors.white, false,
                          size.width * 0.04, context, false),
                    ),
                  ),
                  Text(
                    '${1}',
                    textAlign: TextAlign.end,
                    style: Manger()
                        .styleofText(Colors.white, false, 12, context, false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Appbarwigit(BuildContext context) {}
}
