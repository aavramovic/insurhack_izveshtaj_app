import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/prestart_check_screen.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';
import 'package:insurhack_izveshtaj_app/screens/qr_scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Izveshtai(),
      child: MaterialApp(
        title: 'Дигитален Европски Извештај',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Дигитален Европски Извештај'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const _colorPrimary = Color.fromRGBO(0,145,100, 1);
  static const _colorSecondary = Color.fromRGBO(204,0,64, 1);
  static const _colorTertiary = Color.fromRGBO(0,0,120,1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(0, 204, 140, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100.0,),
            ButtonTheme(
              minWidth: 310.0,
              height: 100.0,
              child: RaisedButton(
                child: Text("Нов Извештај", textScaleFactor: 1.5,),
                textColor: _colorWhite,
                color: _colorSecondary,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return PreStartCheck();
                  }));
                },
              ),
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              minWidth: 310.0,
              height: 100.0,
              child: RaisedButton(
                child: Text("Скенирај постоечки QR код", textScaleFactor: 1.5,),
                textColor: _colorWhite,
                color: _colorSecondary,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return QRViewExample();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
