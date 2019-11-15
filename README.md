# Bachelor-Flutter
### My bachelor thesis project (Bluetooth Low Energy with iBeacons, QR Scanner) implemented in Google's React Native for iOS and Android

## Dependencies
* flutter_svg: ^0.14.3
* flutter_blue: 0.6.2 (^0.6.3+1 crashes)
* qr_code_scanner: ^0.0.12
* provider: ^3.1.0+1

## Getting started
To install all needed node_modules and dependencies:
1. `flutter run`

## Important/Troubleshooting:
* Set Flutter SDK correctly: https://flutter.dev/docs/get-started/install

* code signing needed in XCode
* iOS 13 iOS needs AlwaysUsageBluetooth in info.plist when using BLE
* same in Android

## Todo
Design:
* QR View anpassen (animieren, Größe, etc.)
