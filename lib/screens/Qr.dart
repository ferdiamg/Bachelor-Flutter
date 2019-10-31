import 'package:flutter/material.dart';

class Qr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Place the QR code inside the area",
              style: TextStyle(
                  color: Color(0x4A4A4A).withOpacity(1),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Scanning will start automatically",
              style: TextStyle(
                  color: Color(0x4A4A4A).withOpacity(1),
                  fontSize: 16,
            )),
          ],
        ),
      ),
    );
  }
}
