import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:animator/animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 225,
                      width: 225,
                      child: QRView(
                        key: qrKey,
                        onQRViewCreated: _onQRViewCreated,
                      ),
                    ),
                  ),
                ),
                Center(
                    child:
                        SvgPicture.asset('assets/qrmarker.svg', height: 290)),
                Animator(
                  tween:
                      Tween<Offset>(begin: Offset(0, -50), end: Offset(0, 50)),
                  duration: Duration(seconds: 2),
                  curve: Curves.decelerate,
                  cycles: 0,
                  builder: (anim) => FractionalTranslation(
                    translation: anim.value,
                    child: Container(
                      height: 3,
                      width: 300,
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0076FF).withOpacity(0.15),
                            blurRadius: 7.0,
                            spreadRadius: 5.0,
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: Container(
                        height: 3,
                        width: 300,
                        color: Color(0x0076FF).withOpacity(1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      setState(() {
        qrText = scanData;
      });
      displayDialog(scanData);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void displayDialog(String scanData) {
    if (Platform.isIOS) {
      showDialog(
        context: context,
        builder: (BuildContext context) => new CupertinoAlertDialog(
          title: new Text("Alert"),
          content: new Text(scanData),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text("OK"),
              onPressed: () {
                Navigator.pop(context, 'Cancel');
                controller.resumeCamera();
              },
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert"),
            content: new Text(scanData),
            actions: <Widget>[
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  controller.resumeCamera();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
