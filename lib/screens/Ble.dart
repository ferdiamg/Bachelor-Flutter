import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/wifi.svg',
                  height: 95,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text("Currently no beacons found.", style: TextStyle(color: Color(0xCFCFCF).withOpacity(1), fontSize: 15.5, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 105.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text("Scan for Beacons", style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600)),
              onPressed: () {
                print("Pressed");
              },
              textColor: Colors.white,
              padding: EdgeInsets.only(left: 45, top: 18, right: 45, bottom: 18),
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
