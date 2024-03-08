import 'package:flutter/material.dart';



class VolumeConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volume Unit Converter',
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

  final List<String> volumeUnits = ['Liter', 'Gallon', 'Cubic Meter', 'Cubic Feet'];

  @override
  void initState() {
    super.initState();
    inputUnit = volumeUnits[0];
    outputUnit = volumeUnits[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volume Unit Converter'),
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
                    items: volumeUnits.map((unit) {
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
                    items: volumeUnits.map((unit) {
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

    if (inputUnit == 'Liter') {
      if (outputUnit == 'Gallon') {
        convertedValue *= 0.264172;
      } else if (outputUnit == 'Cubic Meter') {
        convertedValue /= 1000;
      } else if (outputUnit == 'Cubic Feet') {
        convertedValue *= 0.0353147;
      }
    } else if (inputUnit == 'Gallon') {
      if (outputUnit == 'Liter') {
        convertedValue *= 3.78541;
      } else if (outputUnit == 'Cubic Meter') {
        convertedValue *= 0.00378541;
      } else if (outputUnit == 'Cubic Feet') {
        convertedValue *= 0.133681;
      }
    } else if (inputUnit == 'Cubic Meter') {
      if (outputUnit == 'Liter') {
        convertedValue *= 1000;
      } else if (outputUnit == 'Gallon') {
        convertedValue *= 264.172;
      } else if (outputUnit == 'Cubic Feet') {
        convertedValue *= 35.3147;
      }
    } else if (inputUnit == 'Cubic Feet') {
      if (outputUnit == 'Liter') {
        convertedValue *= 28.3168;
      } else if (outputUnit == 'Gallon') {
        convertedValue *= 7.48052;
      } else if (outputUnit == 'Cubic Meter') {
        convertedValue *= 0.0283168;
      }
    }

    setState(() {
      result = '$inputValue $inputUnit is converted to $convertedValue $outputUnit';
    });
  }
}
