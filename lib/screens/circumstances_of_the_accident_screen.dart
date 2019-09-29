import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurhack_izveshtaj_app/main.dart';
import 'package:insurhack_izveshtaj_app/screens/prestart_check_screen.dart';
import 'package:insurhack_izveshtaj_app/screens/confirmation_screen.dart';
import 'package:insurhack_izveshtaj_app/screens/start_new_screen.dart';
class CircumstancesOfTheAccidentScreen extends StatefulWidget {
  static const routeName = '/circumstances_of_the_accident';

  @override
  _CircumstancesOfTheAccidentScreenState createState() =>
      _CircumstancesOfTheAccidentScreenState();
}

class _CircumstancesOfTheAccidentScreenState
    extends State<CircumstancesOfTheAccidentScreen> {
  // circumstances
  var _wasParked = false;
  var _openDoor = false;
  var _enteringParking = false;
  var _exitingParking = false;
  var _enteringParkingOrOther = false;
  var _enteringTrafficCircle = false;
  var _drivingInTrafficCircle = false;
  var _sameDirectionSameLane = false;
  var _sameDirectionDifferentLane = false;
  var _changingLane = false;
  var _overtake = false;
  var _turnRight = false;
  var _turnLeft = false;
  var _reverse = false;
  var _wrongLane = false;
  var _rightSideJunction = false;
  var _streetSigns = false;

  static const _colorPrimary = Color.fromRGBO(0, 145, 100, 1);
  static const _colorSecondary = Color.fromRGBO(204, 0, 64, 1);
  static const _colorTertiary = Color.fromRGBO(0, 0, 120, 1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);

  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  int navigationIndex = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Околности"),
        backgroundColor: _colorPrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SwitchListTile(
                  title: const Text('било паркирано/застанало'),
                  value: _wasParked,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _wasParked = value;
                    });
                  },
                ), //1
                SwitchListTile(
                  title: const Text('напуштало паркиралиште/отварал/а врата'),
                  value: _openDoor,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _openDoor = value;
                    });
                  },
                ), //2
                SwitchListTile(
                  title: const Text('влегувало на пракинг'),
                  value: _enteringParking,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _enteringParking = value;
                    });
                  },
                ), //3
                SwitchListTile(
                  title: const Text(
                      'излегувало од паркинг, приватно земјиште, спореден пат'),
                  value: _exitingParking,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _exitingParking = value;
                    });
                  },
                ), //4
                SwitchListTile(
                  title: const Text(
                      'влегувало на паркинг, приватно земјиште, спореден пат'),
                  value: _enteringParkingOrOther,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _enteringParkingOrOther = value;
                    });
                  },
                ), //5
                SwitchListTile(
                  title: const Text('се вклучувало во кружен сообраќај'),
                  value: _enteringTrafficCircle,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _enteringTrafficCircle = value;
                    });
                  },
                ), //6
                SwitchListTile(
                  title: const Text('се движело по кружен сообраќај'),
                  value: _drivingInTrafficCircle,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _drivingInTrafficCircle = value;
                    });
                  },
                ), //7
                SwitchListTile(
                  title: const Text(
                      'удрило во задниот дел на другото возило додека се движело во ист правец и на иста лента'),
                  value: _sameDirectionSameLane,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _sameDirectionSameLane = value;
                    });
                  },
                ), //8
                SwitchListTile(
                  title: const Text(
                      'се движело во иста насока но во друга лента'),
                  value: _sameDirectionDifferentLane,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _sameDirectionDifferentLane = value;
                    });
                  },
                ), //9
                SwitchListTile(
                  title: const Text('се престројувало'),
                  value: _changingLane,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _changingLane = value;
                    });
                  },
                ), //10
                SwitchListTile(
                  title: const Text('претекнувало'),
                  value: _overtake,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _overtake = value;
                    });
                  },
                ), //11
                SwitchListTile(
                  title: const Text('вртело десно'),
                  value: _turnRight,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _turnRight = value;
                    });
                  },
                ), //12
                SwitchListTile(
                  title: const Text('вртело лево'),
                  value: _turnLeft,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _turnLeft = value;
                    });
                  },
                ), //13
                SwitchListTile(
                  title: const Text('се движело наназад'),
                  value: _reverse,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _reverse = value;
                    });
                  },
                ), //14
                SwitchListTile(
                  title: const Text(
                      'преминало во лентата на патот во спротивна насока на движење на возилата'),
                  value: _wrongLane,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _wrongLane = value;
                    });
                  },
                ), //15
                SwitchListTile(
                  title: const Text('доаѓало од десна страна(на раскрсница)'),
                  value: _rightSideJunction,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _rightSideJunction = value;
                    });
                  },
                ), //16
                SwitchListTile(
                  title: const Text(
                      'не почитувало знаци на право на предност или црвено светло'),
                  value: _streetSigns,
                  activeColor: _colorRed,
                  onChanged: (bool value) {
                    setState(() {
                      _streetSigns = value;
                    });
                  },
                ), //17
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _colorPrimary,
        key: globalKey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _colorWhite),
            title: new Text(
              'Излези',
              style: TextStyle(color: _colorWhite),
            ),
          ),
          BottomNavigationBarItem(
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Со продолжување на следниот чекор потоа нема да можете да се вратите на овој чекор", textAlign: TextAlign.center, textScaleFactor: 1.2,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Прифаќам"),
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (_) {
                                          return StartNew();
                                        }
                                    ));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                break;
            }
          });
        },
      ),

    );
  }
}

