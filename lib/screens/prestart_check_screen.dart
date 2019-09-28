import 'package:flutter/material.dart';
import 'package:insurhack_izveshtaj_app/screens/circumstances_of_the_accident_screen.dart';

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

  // police button
  bool enableCallButton() {
    return _alcohol || _injured || _driveable || _plates || _licence;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Околности"),
        backgroundColor: Color.fromRGBO(150, 0, 200, 70),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Дали некој од учесниците е во алкохолизирана состојба?'),
                  value: _alcohol,
                  onChanged: (bool value) { setState(() { _alcohol = value; }); },
                  secondary: const Icon(Icons.battery_full),
                ),
                SwitchListTile(
                  title: const Text('Дали има повредени?'),
                  value: _injured,
                  onChanged: (bool value) { setState(() { _injured = value; }); },
                  secondary: const Icon(Icons.add),
                ),
                SwitchListTile(
                  title: const Text('Дали некое од возилата е во неподвижна состојба?'),
                  value: _driveable,
                  onChanged: (bool value) { setState(() { _driveable = value; }); },
                  secondary: const Icon(Icons.directions_car),
                ),
                SwitchListTile(
                  title: const Text('Дали некое од возилата е со странски регистарски таблици?'),
                  value: _plates,
                  onChanged: (bool value) { setState(() { _plates = value; }); },
                  secondary: const Icon(Icons.local_car_wash),
                ),
                SwitchListTile(
                  title: const Text('Дали некој од возачите е без возачка дозвола?'),
                  value: _licence,
                  onChanged: (bool value) { setState(() { _licence = value; }); },
                  secondary: const Icon(Icons.credit_card),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Повикај полиција"),
                      onPressed: _alcohol || _injured || _driveable || _plates || _licence ? () {
                        // TODO route to police call
                      } : null,
                    ),
                    RaisedButton(
                      child: Text("Продолжи"),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) {
                                  return CircumstancesOfTheAccidentScreen();
                                }
                            )
                        );
                      },
                    )
                  ],
                )
            ),
          ],
        )
      ),bottomNavigationBar:BottomNavigationBar(
      type: BottomNavigationBarType.fixed ,
      backgroundColor: Color.fromRGBO(150, 0, 200, 70),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.call,color:Color.fromRGBO(255, 255, 255, 100)),
          title: new Text('Повикај полиција',style: TextStyle(color:Color.fromRGBO(255, 255, 255, 100) ),),

        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward_ios,color:Color.fromRGBO(255, 255, 255, 100)),
          title: new Text('Продолжи',style: TextStyle(color:Color.fromRGBO(255, 255, 255, 100) ),),

        )
      ],
      onTap: (index){

       },
    )
    );
  }
}
