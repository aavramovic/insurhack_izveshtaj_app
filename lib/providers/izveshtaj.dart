import 'package:flutter/material.dart';

import 'package:insurhack_izveshtaj_app/providers/driver.dart';
import 'package:insurhack_izveshtaj_app/providers/witness.dart';

class Izveshtaj {
  // String collectiveId;

  // Pochetni informacii
  DateTime dateTime;
  bool damageToOtherVehicles;
  bool damageToOtherProperty;

  //Informacii

      // Polisa i info za vozachkata
      String brojNaPolisa;
      bool osigurenikIstSoVozach;
      // Za vozachot (kombo so vozachkata)
      Driver driver;

      // lokacija od mestoto
      String imageUrl;
      int latitude;
      int longitude;

      // slika ???

  // Okolnosti za voziloto
  bool stoi;
  bool vrata;
  bool vlezParking;
  bool izlezParking;
  bool vlezPrivat;
  bool voKruzhen;
  bool poKruzhen;
  bool zadenIstIst;
  bool istaNasokaDrLenta;
  bool prestrojuvanje;
  bool preteknuvanje;
  bool vrtiDesno;
  bool vrtiLevo;
  bool dviziNazad;
  bool preminaloSpr;
  bool desnoRaskr;
  bool znaciSemafor;

  // Lichni zabeleshki
  String notes;


  // TODO add witnesses (w/ a class)
  // final List<Witness> witnesses;

  Izveshtaj({dateTime, damageToOtherVehicles, damageToOtherProperty,});
}