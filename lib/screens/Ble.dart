import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/wifi.svg',
                height: 100,
              ),
              Text("Currently no beacons found."),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text("Scan for Beacons"),
              onPressed: () {
                print("Pressed");
              },
              textColor: Colors.white,
              padding: EdgeInsets.all(20.0),
              color: Color(0x0076FF).withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
