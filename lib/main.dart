import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Home.dart';
import './screens/BeaconState.dart';

void main() { 
  runApp(
    ChangeNotifierProvider(
      builder: (context) => BeaconState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bachelor Flutter',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
