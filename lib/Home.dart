import 'package:flutter/material.dart';
import 'screens/Ble.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ble(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 15.0,
              spreadRadius: 5.0,
              offset: Offset(0, 8),
            ),
          ],
          borderRadius: new BorderRadius.circular(100),
        ),
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          child: Image(image: AssetImage('assets/icon.png')),
          onPressed: () {},
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SvgPicture.asset(
              'assets/ble.svg',
              height: 26,
              allowDrawingOutsideViewBox: true,
            ),
            SvgPicture.asset(
              'assets/qr.svg',
              height: 30,
              allowDrawingOutsideViewBox: true,
            )
          ]),
        ),
      ),
    );
  }
}
