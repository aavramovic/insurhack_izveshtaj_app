import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insurhack_izveshtaj_app/data/path_histories.dart';

import 'draw_screen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        bottomSheet:Draw(),
        //bottomNavigationBar: Draw(),
      ),

    );
  }
}
/*class Car extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/car1.png');
    var image = new Image(image: assetsImage,width: 100,height: 50);
    return Container(child: image,);
  }
}*/




class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
 static var assetsImage = new AssetImage('assets/car1.png');
  var image = new Image(image: assetsImage,width: 200,height: 100);
  @override
  Widget build(BuildContext context) {
  return Stack(
      children: <Widget>[
        Cars(Offset(0.0,0.0), image),
        Cars(Offset(300.0,0.0), image),
        Draw(),

        //DragBox(Offset(0.0, 0.0), 'Box One', Colors.blueAccent),
        DragBox(Offset(300.0, 0.0), 'Box Two', Colors.orange),
        //DragBox(Offset(300.0, 0.0), 'Box Three', Colors.lightGreen,new Car()),
        Positioned(
          left: 100.0,
          bottom: 0.0,
          //child: Draw(),
        )
      ]
  );
  }
}
          /*child: DragTarget(
            onAccept: (Color color) {
              caughtColor = color;
            },
            builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
                ) {
              *//*return Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                ),
                child: Center(
                  child: Text("Drag Here!"),
                ),
              );*//*
            },
          ),
        )
      ],
    );
  }
}
}*/


class Cars extends StatefulWidget {
  final Offset initPos;
  final Image img;
  Cars(this.initPos,this.img);
  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  Offset position = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
      var assetsImage = new AssetImage('assets/car1.png');
      var image = new Image(image: assetsImage,width: 200,height: 100);
      return Positioned(left: position.dx,top: position.dy,
      child: Draggable(
          data: image,
          child: Container(child: image),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Container(
            width: 210.0,
            height: 110.0
          ),
        /*childWhenDragging: Listener(onPointerDown: (PointerDownEvent event){
            position=event.position;
      },
        ),*///OVA MOZHE DA POMOGNE NEKAKO AMA NEZ DA PRODOLZAM NE MI USPEVA NIKAKO

      ),
      );
  }

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }
}
class DragBox extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  /*var assetsImage = new AssetImage('assets/car1.png');
  var image = new Image(image: assetsImage,width: 300,height: 150);*/
  //Car car;
  DragBox(this.initPos, this.label, this.itemColor);

  @override
  DragBoxState createState() => DragBoxState();
}

class DragBoxState extends State<DragBox> {
  Offset position = Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.itemColor,
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}