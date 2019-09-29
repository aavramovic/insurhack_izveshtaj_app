import 'package:flutter/material.dart';
import 'package:insurhack_izveshtaj_app/main.dart';
import 'package:insurhack_izveshtaj_app/screens/circumstances_of_the_accident_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'signature.dart';

class PreStartCheck extends StatefulWidget {
  static const routeName = '/prestart_check';

  @override
  _PreStartCheckState createState() => _PreStartCheckState();
}

class _PreStartCheckState extends State<PreStartCheck> {
  // circumstances
  var _alcohol = false;
  var _injured = false;
  var _driveable = false;
  var _plates = false;
  var _licence = false;
  static const _colorPrimary = Color.fromRGBO(0, 145, 100, 1);
  static const _colorSecondary = Color.fromRGBO(204, 0, 64, 1);
  static const _colorTertiary = Color.fromRGBO(0, 0, 120, 1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);

  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  int navigationIndex = 0;
  static const IconData rightCircle = const IconData(0xf362,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);

  bool enableCallButton() {
    return _alcohol || _injured || _driveable || _plates || _licence;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Околности"),
          backgroundColor: Color.fromRGBO(0, 204, 140, 1),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                SwitchListTile(
                  title: const Text(
                      'Дали некој од учесниците е во алкохолизирана состојба?'),
                  value: _alcohol,
                  onChanged: (bool value) {
                    setState(() {
                      _alcohol = value;
                    });
                  },
                  secondary:
                      const Icon(Icons.battery_full, color: _colorPrimary),
                  activeColor: _colorRed,
                ),
                SwitchListTile(
                  title: const Text('Дали има повредени?'),
                  value: _injured,
                  onChanged: (bool value) {
                    setState(() {
                      _injured = value;
                    });
                  },
                  secondary: const Icon(Icons.add, color: _colorPrimary),
                  activeColor: _colorRed,
                ),
                SwitchListTile(
                  title: const Text(
                      'Дали некое од возилата е во неподвижна состојба?'),
                  value: _driveable,
                  onChanged: (bool value) {
                    setState(() {
                      _driveable = value;
                    });
                  },
                  secondary:
                      const Icon(Icons.directions_car, color: _colorPrimary),
                  activeColor: _colorRed,
                ),
                SwitchListTile(
                  title: const Text(
                      'Дали некое од возилата е со странски регистарски таблици?'),
                  value: _plates,
                  onChanged: (bool value) {
                    setState(() {
                      _plates = value;
                    });
                  },
                  secondary:
                      const Icon(Icons.local_car_wash, color: _colorPrimary),
                  activeColor: _colorRed,
                ),
                SwitchListTile(
                  title: const Text(
                      'Дали некој од возачите е без возачка дозвола?'),
                  value: _licence,
                  onChanged: (bool value) {
                    setState(() {
                      _licence = value;
                    });
                  },
                  secondary:
                      const Icon(Icons.credit_card, color: _colorPrimary),
                  activeColor: _colorRed,
                ),
              ],
            ),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:
              !enableCallButton() ? _colorPrimary : _colorSecondary,
          key: globalKey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: _colorWhite),
              title: new Text(
                'Излези',
                style: TextStyle(color: _colorWhite),
              ),
            ),
            enableCallButton()
                ? BottomNavigationBarItem(
                    icon: Icon(Icons.call, color: _colorWhite),
                    title: new Text(
                      'Повикај полиција',
                      style: TextStyle(color: _colorWhite),
                    ),
                  )
                : BottomNavigationBarItem(
                    backgroundColor: _colorWhite,
                    icon: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: _colorWhite,
                    ),
                    title: new Text(
                      'Продолжи',
                      style: TextStyle(color: _colorWhite),
                    ),
                  )
          ],
          onTap: (int index) {
            setState(() {
              navigationIndex = index;
              switch (navigationIndex) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return MyApp();
                  }));
                  break;
                case 1:
                  if (enableCallButton()) {
                    _launchCaller();
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return CircumstancesOfTheAccidentScreen();
                    }));
                  }
                  break;
              }
            });
          },
        )
    );
  }
}

_launchCaller() async {
  const url = "tel:192";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
