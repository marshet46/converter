import 'package:flutter/material.dart';


class DistanceConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Distance Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterPage(),
    );
  }
}

class UnitConverterPage extends StatefulWidget {
  @override
  _UnitConverterPageState createState() => _UnitConverterPageState();
}

class _UnitConverterPageState extends State<UnitConverterPage> {
  double? inputValue;
  late String inputUnit;
  late String outputUnit;
  String result = '';

  final List<String> distanceUnits = ['Meter', 'Kilometer', 'Centimeter', 'Millimeter'];

  @override
  void initState() {
    super.initState();
    inputUnit = distanceUnits[0];
    outputUnit = distanceUnits[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Unit Converter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value);
                });
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: inputUnit,
                    items: distanceUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        inputUnit = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'From',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: outputUnit,
                    items: distanceUnits.map((unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        outputUnit = value!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'To',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ElevatedButton(
  onPressed: () {
    convert();
  },
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.green, // text color
    elevation: 3, // elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // rounded corners
    ),
  ),
  child: Text(
    'Convert',
    style: TextStyle(
      color: Colors.white, // text color
      fontSize: 16, // text size
      fontWeight: FontWeight.bold, // text weight
    ),
  ),
),

            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }

  void convert() {
    if (inputValue == null) {
      setState(() {
        result = 'Please enter a valid value';
      });
      return;
    }

    double convertedValue = inputValue!;

    if (inputUnit == 'Meter') {
      if (outputUnit == 'Kilometer') {
        convertedValue /= 1000;
      } else if (outputUnit == 'Centimeter') {
        convertedValue *= 100;
      } else if (outputUnit == 'Millimeter') {
        convertedValue *= 1000;
      }
    } else if (inputUnit == 'Kilometer') {
      if (outputUnit == 'Meter') {
        convertedValue *= 1000;
      } else if (outputUnit == 'Centimeter') {
        convertedValue *= 100000;
      } else if (outputUnit == 'Millimeter') {
        convertedValue *= 1000000;
      }
    } else if (inputUnit == 'Centimeter') {
      if (outputUnit == 'Meter') {
        convertedValue /= 100;
      } else if (outputUnit == 'Kilometer') {
        convertedValue /= 100000;
      } else if (outputUnit == 'Millimeter') {
        convertedValue *= 10;
      }
    } else if (inputUnit == 'Millimeter') {
      if (outputUnit == 'Meter') {
        convertedValue /= 1000;
      } else if (outputUnit == 'Kilometer') {
        convertedValue /= 1000000;
      } else if (outputUnit == 'Centimeter') {
        convertedValue /= 10;
      }
    }

    setState(() {
      result = '$inputValue $inputUnit is converted to $convertedValue $outputUnit';
    });
  }
}
