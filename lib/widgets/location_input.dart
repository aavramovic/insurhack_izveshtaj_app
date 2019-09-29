import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';

import 'package:insurhack_izveshtaj_app/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(latitude: locationData.latitude, longitude: locationData.longitude, zoom: 20);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
    // print(locationData.latitude);
    // print(locationData.longitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentUserLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text(
            'No Location Chosen',
            textAlign: TextAlign.center,
          )
              : Image.network(
            _previewImageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                FontAwesomeIcons.pencilRuler,
              ),
              label: Text('Скицирај ја несреќата'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _getCurrentUserLocation,
            ),
          ],
        ),
      ],
    );
  }
}
