import 'package:flutter/material.dart';
import 'screens/prestart_check_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дигитален Европски Извештај',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Дигитален Европски Извештај'),
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
        backgroundColor: _colorPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: RaisedButton(
                child: Text("Нов Извештај"),
                textColor: _colorWhite,
                color: _colorSecondary,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return PreStartCheck();
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
