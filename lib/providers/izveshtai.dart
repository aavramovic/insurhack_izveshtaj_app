import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:insurhack_izveshtaj_app/providers/izveshtaj.dart';

class Izveshtai with ChangeNotifier {
  String _brojNaIzveshtaj;

  String get brojNaIzveshtaj {
    return _brojNaIzveshtaj;
  }

  Future<void> novIzveshtaj(Izveshtaj izveshtaj) async {
    final url = 'https://izveshtai.firebaseio.com/izveshtai.json';

    try {
      // first save to database
      final response = await http
          .post(url, body: json.encode({
        'datetime': izveshtaj.dateTime.toIso8601String(),
        'location': 'TO-DO',
        'damageToOtherVehicles': izveshtaj.damageToOtherVehicles,
        'damageToOtherProperty': izveshtaj.damageToOtherProperty,

      }),
      );

      final firebaseId = json.decode(response.body)['name'];
      _brojNaIzveshtaj = firebaseId;

      notifyListeners();
    } catch (error) {
      print(error);
      throw(error);
    }
  }

  void setQRCode(String qrcode) {
    _brojNaIzveshtaj = qrcode;
  }
}