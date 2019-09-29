import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PersonalNotesScreen extends StatefulWidget {
  @override
  _PersonalNotesScreenState createState() => _PersonalNotesScreenState();
}

class _PersonalNotesScreenState extends State<PersonalNotesScreen> {

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
        title: Text("Лични забелешки"),
        backgroundColor: _colorPrimary,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              maxLines: 6,
              decoration: InputDecoration(labelText: 'Лични забелешки'),
              onChanged: (value) { setState(() {
                // TODO sredi za informaciite
              });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _colorPrimary,
        key: globalKey,
        items: [
          BottomNavigationBarItem(
            // activeIcon: Icon(Icons.add_to_home_screen, color: Colors.grey,),
            icon: Icon(Icons.home, color: _colorPrimary),
            title: Text(''),
            /*
            title: new Text(
              'Излези',
              style: TextStyle(color: _colorWhite),
            ),
             */
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
          null;
        },
      ),

    );
  }
}


