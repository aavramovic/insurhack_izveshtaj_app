import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtaj.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';
import 'package:insurhack_izveshtaj_app/providers/driver.dart';
import 'package:insurhack_izveshtaj_app/widgets/image_input.dart';
import 'package:insurhack_izveshtaj_app/widgets/location_input.dart';
import 'package:insurhack_izveshtaj_app/screens/qr_generated_code_screen.dart';
import 'circumstances_of_the_accident_screen.dart';


class MainFormScreen extends StatefulWidget {
  MainFormScreen({Key key}) : super(key: key);

  @override
  _MainFormScreenState createState() => _MainFormScreenState();
}

class _MainFormScreenState extends State<MainFormScreen> with SingleTickerProviderStateMixin {
  var _policyNumber;
  bool _showExtraDriverFields = true;
  Driver _driver;
  File _pickedImage;

  final List<Tab> myTabs = <Tab>[
    new Tab(icon: Icon(Icons.person),),
    new Tab(icon: Icon(Icons.credit_card),),
    new Tab(icon: Icon(Icons.photo_camera),),
  ];

  TabController _tabController;
  var index = 0;
  int navigationIndex =0;

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this, initialIndex: index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String brojNaIzveshtaj = Provider.of<Izveshtai>(context, listen: false).brojNaIzveshtaj;
    Izveshtaj izveshtaj = Provider.of<Izveshtai>(context, listen: false).izveshtaj;
    const _colorPrimary = Color.fromRGBO(0,145,100, 1);
    const _colorSecondary = Color.fromRGBO(204,0,64, 1);
    const _colorTertiary = Color.fromRGBO(0,0,120,1);
    const _colorRed = Color.fromRGBO(245, 7, 7, 1);
    const _colorWhite = Color.fromRGBO(255, 255, 255, 1);
    const _colorCalm = Color.fromRGBO(94, 169, 190, 1);


    final _formKey = GlobalKey<FormState>();
    GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');

    return Scaffold(
      appBar: AppBar(
        title: Text('Информации'),
        backgroundColor: _colorPrimary,
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.qrcode),
            //onPressed: () { _showQrCode(brojNaIzveshtaj); },
            // onPressed: () { _showQrRAlert(context, brojNaIzveshtaj); },
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return QRGeneratedCodeScreen();
                },
              ));
            },
          )
        ],
        bottom: TabBar(
          indicatorColor: _colorWhite,
          controller: _tabController,
          tabs: [
            new Tab(icon: Icon(Icons.person),),
            new Tab(icon: Icon(Icons.credit_card),),
            new Tab(icon: Icon(Icons.photo_camera),),
      ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                TextField(

                  decoration: InputDecoration(labelText: 'Број на вашата полиса',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _colorCalm),
                    ),   ),

                  onChanged: (value) { setState(() {
                    _policyNumber = value;
                    izveshtaj.brojNaPolisa = value;
                  });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Број на возачката дозвола',focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _colorCalm),
                  ),   ),
                  onChanged: (value) {
                    setState(() {
                      _driver.licenceNumber = value;
                      izveshtaj.driver.licenceNumber = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Категорија на возачката дозвола',focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _colorCalm),
                  ),   ),
                  onChanged: (value) {
                    setState(() {
                      _driver.licenceCategory = value;
                      izveshtaj.driver.licenceCategory = value;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Возачката дозвола истекува на (ден.месец.година)',focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _colorCalm),
                  ),   ),
                  onChanged: (value) {
                    setState(() {
                      _driver.licenceValidUntil = value;
                      izveshtaj.driver.licenceValidUntil = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text("Возачот и осигуреникот се иста личност"),
                  value: !_showExtraDriverFields, onChanged: (bool value) { setState(() {
                    _showExtraDriverFields = !value;
                    izveshtaj.osigurenikIstSoVozach = value;
                  });},
                  activeColor: _colorCalm,
                ),
                Container(
                  child: !_showExtraDriverFields ? null : Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Име',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) { setState(() {
                          _driver.name = value;
                          izveshtaj.driver.name = value;
                        });
                        print(izveshtaj);
                        print(Provider.of<Izveshtai>(context, listen: false).izveshtaj);
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Презиме',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.surname = value;
                            izveshtaj.driver.surname = value;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Адреса на живеење',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.address = value;
                            izveshtaj.driver.address = value;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Држава на престој (по адреса)',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.country = value;
                            izveshtaj.driver.country = value;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Дата на раѓање (ден.месец.година)',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.birthdate = value;
                            izveshtaj.driver.birthdate = value;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Телефонски број',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.telephoneNumber = value;
                            izveshtaj.driver.telephoneNumber = value;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'E-Mail адреса',focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _colorCalm),
                        ),   ),
                        onChanged: (value) {
                          setState(() {
                            _driver.email = value;
                            izveshtaj.driver.email = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                ImageInput(_selectImage),
                SizedBox(height: 10.0,),
                LocationInput(),
              ],
            ),
          ),
        ],
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
          Provider.of<Izveshtai>(context, listen: false).izveshtaj = izveshtaj;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) {
                  return CircumstancesOfTheAccidentScreen();
                }
            )
         );
         },
      ),
    );

  }


  void _showQrCode (String brojNaIzveshtaj){
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("QR код на извештајот"),
          content:
          Text(brojNaIzveshtaj),
          //QrImage(
          //data: brojNaIzveshtaj,
          //version: QrVersions.auto,
          //size: 200.0,
          //),
          actions: <Widget>[
            new FlatButton(
              child: Text('Затвори'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _showQrRAlert(context, String brojNaIzveshtaj) {
    Alert(
      context: context,
      title: "QR Код",
      desc: "Прикажете го на другите учесници во несреќата",
      content:
          Padding(
            padding: EdgeInsets.all(8.0),
            child: QrImage(
              data: brojNaIzveshtaj,
              version: QrVersions.auto,
              size: 200.0,
            ),
          )
      ).show();
  }

}
