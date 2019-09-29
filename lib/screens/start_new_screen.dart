import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:insurhack_izveshtaj_app/providers/izveshtaj.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';
import 'package:insurhack_izveshtaj_app/screens/main_form_screen.dart';


class StartNew extends StatefulWidget {
  @override
  _StartNewState createState() => _StartNewState();
}

class _StartNewState extends State<StartNew> {
  final _formKey = GlobalKey<FormState>();

  var _newIzveshtaj = Izveshtaj(dateTime: DateTime.now(), location: '', damageToOtherProperty: false, damageToOtherVehicles: false);

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveIzveshtaj,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Text('Датум', style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text(_newIzveshtaj.dateTime.toIso8601String()),
              ),
              ListTile(
                leading: Text('Место', style: TextStyle(fontWeight: FontWeight.bold),),
                title: Text(_newIzveshtaj.location.toString()),
                // TODO implement location properly
              ),
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
        ),
    );
  }
}
