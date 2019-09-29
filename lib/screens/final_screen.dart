import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  static const _colorPrimary = Color.fromRGBO(0, 145, 100, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Успешно"),
        backgroundColor: _colorPrimary,
      ) ,
      body: Center(
        child: Text("Успешно го пополнивте европскиот извештај!"),
      ),
    );
  }
}
