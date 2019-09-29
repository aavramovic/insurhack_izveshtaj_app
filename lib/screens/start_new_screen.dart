import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:insurhack_izveshtaj_app/providers/izveshtaj.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';
import 'package:insurhack_izveshtaj_app/screens/main_form_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurhack_izveshtaj_app/main.dart';


class StartNew extends StatefulWidget {
  @override
  _StartNewState createState() => _StartNewState();
}

class _StartNewState extends State<StartNew> {

  static const _colorPrimary = Color.fromRGBO(0, 145, 100, 1);
  static const _colorSecondary = Color.fromRGBO(204, 0, 64, 1);
  static const _colorTertiary = Color.fromRGBO(0, 0, 120, 1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);
  final _formKey = GlobalKey<FormState>();
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

  var _newIzveshtaj = Izveshtaj(dateTime: DateTime.now(), location: '', damageToOtherProperty: false, damageToOtherVehicles: false);


  int navigationIndex = 0;
  var _isLoading = false;

  Future<void> _saveIzveshtaj() async {
    setState(() {
      _isLoading = true;
    });

    Provider.of<Izveshtai>(context, listen: false)
      .novIzveshtaj(_newIzveshtaj)
      .catchError((error) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Грешка'),
            actions: <Widget>[
              FlatButton(child: Text('ОК'), onPressed: () {
                Navigator.of(ctx).pop();
              }),
            ],
          ),
        );
      }).then((_) {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) {
          return MainFormScreen();
        }
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Почетни Информации"),
        backgroundColor: _colorPrimary,
        /*
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveIzveshtaj,
          )
        ],

         */
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text('Датум', style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text(DateFormat('yyyy-MM-dd – kk:mm').format(_newIzveshtaj.dateTime), textAlign: TextAlign.center,),
              ),
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SwitchListTile(
                    title: const Text('Дали е причинета штета на други возила?'),
                    value: false,
                    onChanged: (bool value) { setState(() { _newIzveshtaj.damageToOtherVehicles = value; }); },
                    secondary: const Icon(FontAwesomeIcons.carCrash, color: _colorPrimary,),
                  ),
                  SwitchListTile(
                    title: const Text('Дали е причинета штета на околни предмети?'),
                    value: false,
                    onChanged: (bool value) { setState(() { _newIzveshtaj.damageToOtherProperty = value; }); },
                    secondary: const Icon(Icons.traffic, color: _colorPrimary,),
                  ),

                ],

              )

            ],
          ),
          /*
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Text('Датум', style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text(DateFormat('yyyy-MM-dd – kk:mm').format(_newIzveshtaj.dateTime), textAlign: TextAlign.center,),
              ),
              /*
              ListTile(
                leading: Text('Место', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                title: Text(_newIzveshtaj.location.toString()),
                // TODO implement location properly
              ),
               */
              SwitchListTile(
                title: const Text('Дали е причинета штета на други возила?'),
                value: false,
                onChanged: (bool value) { setState(() { _newIzveshtaj.damageToOtherVehicles = value; }); },
                secondary: const Icon(Icons.local_car_wash),
              ),
              SwitchListTile(
                title: const Text('Дали е причинета штета на околни предмети?'),
                value: false,
                onChanged: (bool value) { setState(() { _newIzveshtaj.damageToOtherProperty = value; }); },
                secondary: const Icon(Icons.traffic),
              ),
            ],
          ),

           */
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
                                  onPressed: _saveIzveshtaj,
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
