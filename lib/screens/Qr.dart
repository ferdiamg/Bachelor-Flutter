import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class Qr extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {
  String result = "";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

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
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(this.result,
                  style: TextStyle(
                    color: Color(0xCFCFCF).withOpacity(1),
                    fontSize: 16,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SvgPicture.asset('assets/qrmarker.svg', height: 290),
            ),
            FloatingActionButton.extended(
              icon: Icon(Icons.camera_alt),
              label: Text("Scan"),
              onPressed: _scanQR,
            ),
          ],
        ),
      ),
    );
  }
}
