import 'package:flutter/material.dart';
import 'package:converter/distance.dart';
import 'package:converter/distanceimperial.dart';
import 'package:converter/mass.dart';
import 'package:converter/mass2.dart';
import 'package:converter/temprature.dart';
import 'package:converter/time.dart';
import 'package:converter/volum.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/distance_converter': (context) => DistanceConverterApp(),
        '/distance_imperial_converter': (context) => DistanceImperialConverterApp(),
        '/temperature_converter': (context) => TempratureConverterApp(),
        '/time_converter': (context) => TimeConverterApp(),
        '/mass_converter': (context) => MassConverterApp(),
        '/mass_imperial_converter': (context) => MassImperialConverterApp(),
        '/volume_converter': (context) => VolumeConverterApp(),
      },
      home: ConverterListPage(),
    );
  }
}

class ConverterListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildConverterButton(context, 'Distance Converter (Metric)', '/distance_converter'),
          buildConverterButton(context, 'Distance Converter (Imperial)', '/distance_imperial_converter'),
          buildConverterButton(context, 'Temperature Converter', '/temperature_converter'),
          buildConverterButton(context, 'Time Converter', '/time_converter'),
          buildConverterButton(context, 'Mass Converter (Metric)', '/mass_converter'),
          buildConverterButton(context, 'Mass Converter (Imperial)', '/mass_imperial_converter'),
          buildConverterButton(context, 'Volume Converter', '/volume_converter'),
        ],
      ),
    );
  }

  Widget buildConverterButton(BuildContext context, String label, String route) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        child: Text(label,style: TextStyle(color:Colors.white),),
      ),
    );
  }
}
