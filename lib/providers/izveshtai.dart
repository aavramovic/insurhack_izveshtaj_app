import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:insurhack_izveshtaj_app/providers/izveshtaj.dart';

class Izveshtai with ChangeNotifier {
  String _brojNaIzveshtaj;

  Izveshtaj izveshtaj;

  String get brojNaIzveshtaj {
    return _brojNaIzveshtaj;
  }

  Future<void> dopolniGiSiteInformacii(String firebaseId) async {
    String url = "https://izveshtai.firebaseio.com/izveshtai/$firebaseId.json";

    await http.patch(url, body: json.encode({
      'brojNaPolisa': izveshtaj.brojNaPolisa,
      'licenceNumber': izveshtaj.driver.licenceNumber,
      'licenceCategory': izveshtaj.driver.licenceCategory,
      'licenceValidUntil': izveshtaj.driver.licenceValidUntil,
      'osigurenikIstSoVozach': izveshtaj.osigurenikIstSoVozach,
      'vozachIme': izveshtaj.driver.name,
      'vozachPrezime': izveshtaj.driver.surname,
      'vozachAdresa': izveshtaj.driver.address,
      'vozachDrzhava': izveshtaj.driver.country,
      'vozachDataRagjanje': izveshtaj.driver.birthdate,
      'vozachBroj': izveshtaj.driver.telephoneNumber,
      'vozachEmail': izveshtaj.driver.email,
      'slikaMaps': izveshtaj.imageUrl,
      'latitude': izveshtaj.latitude,
      'longitude': izveshtaj.longitude,
      'stoi': izveshtaj.stoi,
      'vrata': izveshtaj.vrata,
      'vlezParking': izveshtaj.vlezParking,
      'izlezParking': izveshtaj.izlezParking,
      'vlezPrivat': izveshtaj.vlezPrivat,
      'voKruzhen': izveshtaj.voKruzhen,
      'poKruzhen': izveshtaj.poKruzhen,
      'zadenIstIst': izveshtaj.zadenIstIst,
      'istaNasokaDrLenta': izveshtaj.istaNasokaDrLenta,
      'prestrojuvanje': izveshtaj.prestrojuvanje,
      'preteknuvanje': izveshtaj.preteknuvanje,
      'vrtiDesno': izveshtaj.vrtiDesno,
      'vrtiLevo': izveshtaj.vrtiLevo,
      'dviziNazad': izveshtaj.dviziNazad,
      'preminaloSpr': izveshtaj.preminaloSpr,
      'desnoRaskr': izveshtaj.desnoRaskr,
      'znaciSemfor': izveshtaj.znaciSemafor,
      'notes': izveshtaj.notes,
    }));
  }

  Future<void> getIzveshtajByFirebaseId(String firebaseId) async {
    String url = "https://izveshtai.firebaseio.com/izveshtai/$firebaseId.json";
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    _brojNaIzveshtaj = firebaseId;
    izveshtaj.dateTime = extractedData['datetime'];
    izveshtaj.damageToOtherProperty = extractedData['damageToOtherProperty'];
    izveshtaj.damageToOtherVehicles = extractedData['damageToOtherVehicles'];
  }

  Future<void> novIzveshtaj(Izveshtaj izveshtaj) async {
    final url = 'https://izveshtai.firebaseio.com/izveshtai.json';

    try {
      // first save to database
      final response = await http
          .post(url, body: json.encode({
        'datetime': izveshtaj.dateTime.toIso8601String(),
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