import 'package:flutter/material.dart';

class CircumstancesOfTheAccidentScreen extends StatefulWidget {
  static const routeName = '/circumstances_of_the_accident';

  @override
  _CircumstancesOfTheAccidentScreenState createState() => _CircumstancesOfTheAccidentScreenState();
}

class _CircumstancesOfTheAccidentScreenState extends State<CircumstancesOfTheAccidentScreen> {
  // circumstances
  var _wasParked;
  var _openDoor;
  var _enteringParking;
  var _exitingParking;
  var _enteringParkingOrOther;
  var _enteringTrafficCircle;
  var _drivingInTrafficCircle;
  var _sameDirectionSameLane;
  var _sameDirectionDifferentLane;
  var _changingLane;
  var _overtake;
  var _turnRight;
  var _turnLeft;
  var _reverse;
  var _wrongLane;
  var _rightSideJunction;
  var _streetSigns;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Околности"),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SwitchListTile(
                    title: const Text('било паркирано/застанало'),
                    value: _wasParked,
                    onChanged: (bool value) { setState(() { _wasParked = value; }); },
                  ),//1
                  SwitchListTile(
                    title: const Text('напуштало паркиралиште/отварал/а врата'),
                    value: _openDoor,
                    onChanged: (bool value) { setState(() { _openDoor = value; }); },
                  ),//2
                  SwitchListTile(
                    title: const Text('влегувало на пракинг'),
                    value: _enteringParking,
                    onChanged: (bool value) { setState(() { _enteringParking = value; }); },
                  ),//3
                  SwitchListTile(
                    title: const Text('излегувало од паркинг, приватно земјиште, спореден пат'),
                    value: _exitingParking,
                    onChanged: (bool value) { setState(() { _exitingParking = value; }); },
                  ),//4
                  SwitchListTile(
                    title: const Text('влегувало на паркинг, приватно земјиште, спореден пат'),
                    value: _enteringParkingOrOther,
                    onChanged: (bool value) { setState(() { _enteringParkingOrOther = value; }); },
                  ),//5
                  SwitchListTile(
                    title: const Text('се вклучувало во кружен сообраќај'),
                    value: _enteringTrafficCircle,
                    onChanged: (bool value) { setState(() { _enteringTrafficCircle = value; }); },
                  ),//6
                  SwitchListTile(
                    title: const Text('се движело по кружен сообраќај'),
                    value: _drivingInTrafficCircle,
                    onChanged: (bool value) { setState(() { _drivingInTrafficCircle = value; }); },
                  ),//7
                  SwitchListTile(
                    title: const Text('удрило во задниот дел на другото возило додека се движело во ист правец и на иста лента'),
                    value: _sameDirectionSameLane,
                    onChanged: (bool value) { setState(() { _sameDirectionSameLane = value; }); },
                  ),//8
                  SwitchListTile(
                    title: const Text('се движело во иста насока но во друга лента'),
                    value: _sameDirectionDifferentLane,
                    onChanged: (bool value) { setState(() { _sameDirectionDifferentLane = value; }); },
                  ),//9
                  SwitchListTile(
                    title: const Text('се престројувало'),
                    value: _changingLane,
                    onChanged: (bool value) { setState(() { _changingLane = value; }); },
                  ),//10
                  SwitchListTile(
                    title: const Text('претекнувало'),
                    value: _overtake,
                    onChanged: (bool value) { setState(() { _overtake = value; }); },
                  ),//11
                  SwitchListTile(
                    title: const Text('вртело десно'),
                    value: _turnRight,
                    onChanged: (bool value) { setState(() { _turnRight = value; }); },
                  ),//12
                  SwitchListTile(
                    title: const Text('вртело лево'),
                    value: _turnLeft,
                    onChanged: (bool value) { setState(() { _turnLeft = value; }); },
                  ),//13
                  SwitchListTile(
                    title: const Text('се движело наназад'),
                    value: _reverse,
                    onChanged: (bool value) { setState(() { _reverse = value; }); },
                  ),//14
                  SwitchListTile(
                    title: const Text('преминало во лентата на патот во спротивна насока на движење на возилата'),
                    value: _wrongLane,
                    onChanged: (bool value) { setState(() { _wrongLane = value; }); },
                  ),//15
                  SwitchListTile(
                    title: const Text('доаѓало од десна страна(на раскрсница)'),
                    value: _rightSideJunction,
                    onChanged: (bool value) { setState(() { _rightSideJunction = value; }); },
                  ),//16
                  SwitchListTile(
                    title: const Text('не почитувало знаци на право на предност или црвено светло'),
                    value: _streetSigns,
                    onChanged: (bool value) { setState(() { _streetSigns = value; }); },
                  ),//17
                ],
              ),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Повикај полиција"),
                        onPressed: null
                          // TODO route to next page
                      ),
                    ],
                  )
              ),
            ],
          )
      ),
    );
  }
}
