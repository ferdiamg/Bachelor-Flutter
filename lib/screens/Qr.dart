import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './QRViewExample.dart';

class Qr extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Place the QR code inside the area",
                style: TextStyle(
                    color: Color(0x4A4A4A).withOpacity(1),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text('Scanning will start automatically',
                    style: TextStyle(
                      color: Color(0xCFCFCF).withOpacity(1),
                      fontSize: 16,
                    )),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 80.0),
              //   child: SvgPicture.asset('assets/qrmarker.svg', height: 290),
              // ),
              Expanded(
                flex: 1,
                child: QRViewExample(),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}