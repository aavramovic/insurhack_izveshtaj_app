import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:insurhack_izveshtaj_app/providers/izveshtai.dart';
import 'package:flutter/services.dart';
import 'package:insurhack_izveshtaj_app/screens/main_form_screen.dart';


import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';
import 'package:barcode_scan/barcode_scan.dart';


class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}


class _QRViewExampleState extends State<QRViewExample> {

  static const _colorPrimary = Color.fromRGBO(0,145,100, 1);
  static const _colorSecondary = Color.fromRGBO(204,0,64, 1);
  static const _colorTertiary = Color.fromRGBO(0,0,120,1);
  static const _colorRed = Color.fromRGBO(245, 7, 7, 1);
  static const _colorWhite = Color.fromRGBO(255, 255, 255, 1);
  /*
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Вашиот код е: $qrText'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
      Provider.of<Izveshtai>(context, listen: false).setQRCode(qrText);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  */


  String result = "";
  bool success = false;

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = "Кодот е успешно скениран";
        success = true;
        Provider.of<Izveshtai>(context, listen: false).setQRCode(qrResult);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Не дозволивте пристап до камерата";
        });
      } else {
        setState(() {
          result = "Непозната грешка $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "Не скениравте ништо, пробајте повторно";
      });
    } catch (ex) {
      setState(() {
        result = "Непозната грешка $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Скенирај QR код"),
        backgroundColor: _colorPrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              result,
              style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            ButtonTheme(
              minWidth: 310.0,
              height: 100.0,
              child: RaisedButton(
                child: success ? Text("Продолжи", textScaleFactor: 1.2,) : Text("Вклучи ја камерата за скенирање", textScaleFactor: 1.2,),
                textColor: _colorWhite,
                color: _colorPrimary,
                onPressed: success
                    ? () { Navigator.of(context).push(MaterialPageRoute(builder: (_) { return MainFormScreen(); } )); }
                    : _scanQR,
              ),
            ),

          ],
        ),
      ),
      /*
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Вклучи ја камерата за скенирање"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       */
    );
  }
}