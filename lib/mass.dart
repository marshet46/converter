import 'package:flutter/material.dart';


class MassConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Unit Converter',
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

  final List<String> weightUnits = ['Gram', 'Kilogram', 'Pound', 'Ounce'];

  @override
  void initState() {
    super.initState();
    inputUnit = weightUnits[0];
    outputUnit = weightUnits[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Unit Converter'),
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
                    items: weightUnits.map((unit) {
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
                    items: weightUnits.map((unit) {
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

    if (inputUnit == 'Gram') {
      if (outputUnit == 'Kilogram') {
        convertedValue /= 1000;
      } else if (outputUnit == 'Pound') {
        convertedValue *= 0.00220462;
      } else if (outputUnit == 'Ounce') {
        convertedValue *= 0.035274;
      }
    } else if (inputUnit == 'Kilogram') {
      if (outputUnit == 'Gram') {
        convertedValue *= 1000;
      } else if (outputUnit == 'Pound') {
        convertedValue *= 2.20462;
      } else if (outputUnit == 'Ounce') {
        convertedValue *= 35.274;
      }
    } else if (inputUnit == 'Pound') {
      if (outputUnit == 'Gram') {
        convertedValue *= 453.592;
      } else if (outputUnit == 'Kilogram') {
        convertedValue *= 0.453592;
      } else if (outputUnit == 'Ounce') {
        convertedValue *= 16;
      }
    } else if (inputUnit == 'Ounce') {
      if (outputUnit == 'Gram') {
        convertedValue *= 28.3495;
      } else if (outputUnit == 'Kilogram') {
        convertedValue *= 0.0283495;
      } else if (outputUnit == 'Pound') {
        convertedValue *= 0.0625;
      }
    }

    setState(() {
      result = '$inputValue $inputUnit is converted to $convertedValue $outputUnit';
    });
  }
}
