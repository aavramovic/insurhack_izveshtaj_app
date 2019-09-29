import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';

import 'package:insurhack_izveshtaj_app/helpers/location_helper.dart';
import 'package:insurhack_izveshtaj_app/screens/signature.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  String _drawImg;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(latitude: locationData.latitude, longitude: locationData.longitude, zoom: 20);
    final drawImageUrl = LocationHelper.generateLocationPreviewImage(latitude: locationData.latitude, longitude: locationData.longitude, zoom: 28, width: 600, height: 300);


    setState(() {
      _previewImageUrl = staticMapImageUrl;
      _drawImg = drawImageUrl;
    });

    print(drawImageUrl);
    // print(locationData.latitude);
    // print(locationData.longitude);
  }

  _openDrawWidget() {
    // Navigator.of(context).push(Draw(pictureUrl: previewImageUrl,));
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Draw(pictureUrl: _drawImg,);
    }));
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
    final _colorSecondary = Color.fromRGBO(204,0,64, 1);
    final _colorWhite = Color.fromRGBO(255, 255, 255, 1);
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
        FlatButton.icon(
          icon: Icon(FontAwesomeIcons.pencilRuler),
          label: Text('Скицирај ја несреќата'),
          textColor: _colorSecondary,
          onPressed: _openDrawWidget,
        ),
        /*
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                child: Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.pencilRuler),
                    Text(' Скицирај ја несреќата',),
                  ],
                ),
                textColor: _colorWhite,
                color: _colorSecondary,
                onPressed: _openDrawWidget,
              ),
            ),
          ],
        ),

         */
      ],
    );
  }
}
