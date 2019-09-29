import 'package:flutter/material.dart';

import 'package:insurhack_izveshtaj_app/providers/driver.dart';
import 'package:insurhack_izveshtaj_app/providers/witness.dart';

class Izveshtaj {
  // String collectiveId;
  DateTime dateTime;
  String location;
  bool damageToOtherVehicles;
  bool damageToOtherProperty;
  // TODO add witnesses (w/ a class)
  // final List<Witness> witnesses;

  // final bool driverSameAsPolicyOwner;

  // final Driver driver;
  // TODO implement damage picture (overhead from vehicle)

  // final String visibleDamagesToVehicle;
  // final String personalNotes;

  Izveshtaj({
    // @required this.collectiveId,
    @required this.dateTime,
    @required this.location,
    @required this.damageToOtherVehicles,
    @required this.damageToOtherProperty,
    // @required this.driverSameAsPolicyOwner,
    // @required this.driver,
    // @required this.visibleDamagesToVehicle,
    // @required this.personalNotes,
    // @required this.witnesses
  });
}