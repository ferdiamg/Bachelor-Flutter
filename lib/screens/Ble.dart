import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import './BeaconState.dart';

class Ble extends StatefulWidget {
  @override
  _BleState createState() => _BleState();
}

class _BleState extends State<Ble> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void _scanBLE() {
    Provider.of<BeaconState>(context, listen: false).setBeaconStatus(false);

    FlutterBlue flutterBlue = FlutterBlue.instance;
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 1));

    // Listen to scan results
    var subscription = flutterBlue.scanResults.listen((scanResult) {
      // do something with scan result
      scanResult.forEach((result) {
        if (result.device.name == "AMG iBeacon") {
          Provider.of<BeaconState>(context, listen: false)
              .setBeaconStatus(true);
        }
      });
    });

    // Stop scanning
    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Consumer<BeaconState>(
          builder: (context, beaconState, child) {
            return beaconState.beaconFound()
                ? _renderInfo()
                : _renderNotFound();
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 105.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              child: Text("Scan for Beacons",
                  style:
                      TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600)),
              onPressed: () {
                print("Pressed");
                _scanBLE();
              },
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(left: 45, top: 18, right: 45, bottom: 18),
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

  _renderNotFound() {
    return Center(
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
              child: Center(
                child: Text(
                  "Currently no beacons found. \nPlease enable Bluetooth!",
                  style: TextStyle(
                      color: Color(0xCFCFCF).withOpacity(1),
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _renderInfo() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                width: 190.0,
                height: 190.0,
                decoration: new BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                      offset: Offset(0, 8),
                    ),
                  ],
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: AssetImage('assets/dino.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      new BorderRadius.all(new Radius.circular(100.0)),
                  border: new Border.all(
                    color: Color(0x0076FF).withOpacity(1),
                    width: 6.0,
                  ),
                ),
              ),
            ),
            Text(
              "T-Rex",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.7,
                  color: Color(0x4A4A4A).withOpacity(1),
                  fontSize: 27,
                  fontWeight: FontWeight.w700),
            ),
            Container(
              width: 270,
              child: Center(
                child: Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores dolores dolores et ea rebum. Stet clita kasd gubergren, no sea Lorem ipsum dolor sit amet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.7,
                      color: Color(0xCFCFCF).withOpacity(1),
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
