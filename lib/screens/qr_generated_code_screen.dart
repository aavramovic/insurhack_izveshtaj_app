import 'package:flutter/material.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

class QRGeneratedCodeScreen extends StatelessWidget {
  static const _colorPrimary = Color.fromRGBO(0,145,100, 1);
  static const _colorSecondary = Color.fromRGBO(204,0,64, 1);
  static const _colorTertiary = Color.fromRGBO(0,0,120,1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);

  @override
  Widget build(BuildContext context) {
    String QRCode = Provider.of<Izveshtai>(context, listen: false).brojNaIzveshtaj;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            QrImage(
              data: QRCode,
              version: QrVersions.auto,
              size: 300,
              gapless: false,
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Другите учесници во несреќата треба да го скенираат горниот код", textAlign: TextAlign.center,),
            ),
            ButtonTheme(
              minWidth: 310.0,
              height: 100.0,
              child: RaisedButton(
                child: Text("Затвори", textScaleFactor: 1.5,),
                textColor: _colorWhite,
                color: _colorSecondary,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
