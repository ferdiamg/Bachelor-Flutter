import 'package:fl_final/widgets/FABBottomAppBar.dart';
import 'package:flutter/material.dart';
import 'screens/Ble.dart';
import 'widgets/FABBottomAppBar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Ble(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 76.0,
        width: 76.0,
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
      bottomNavigationBar: FABBottomAppBar(
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
              svgPath: 'assets/ble.svg',
              height: 25,
          ),
          FABBottomAppBarItem(
              svgPath: 'assets/qr.svg',
              height: 31,
          ),
        ],
      ),
    );
  }

  void _selectedTab(int value) {
    print("Clicked tab: " + value.toString());
  }
}
