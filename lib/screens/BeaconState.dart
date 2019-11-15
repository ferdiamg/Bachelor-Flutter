import 'package:flutter/material.dart';

class BeaconState extends ChangeNotifier {
  bool _beaconFound = false;

  void setBeaconStatus(bool status) {
    _beaconFound = status;
    notifyListeners();
  }

  bool beaconFound() {
    return _beaconFound == true;
  }
}
