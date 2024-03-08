import 'package:flutter/material.dart';



class TimeConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Unit Converter',
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

  final List<String> timeUnits = ['Seconds', 'Minutes', 'Hours', 'Days'];

  @override
  void initState() {
    super.initState();
    inputUnit = timeUnits[0];
    outputUnit = timeUnits[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Unit Converter'),
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
                    items: timeUnits.map((unit) {
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
                    items: timeUnits.map((unit) {
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

    if (inputUnit == 'Seconds') {
      if (outputUnit == 'Minutes') {
        convertedValue /= 60;
      } else if (outputUnit == 'Hours') {
        convertedValue /= 3600;
      } else if (outputUnit == 'Days') {
        convertedValue /= 86400;
      }
    } else if (inputUnit == 'Minutes') {
      if (outputUnit == 'Seconds') {
        convertedValue *= 60;
      } else if (outputUnit == 'Hours') {
        convertedValue /= 60;
      } else if (outputUnit == 'Days') {
        convertedValue /= 1440;
      }
    } else if (inputUnit == 'Hours') {
      if (outputUnit == 'Seconds') {
        convertedValue *= 3600;
      } else if (outputUnit == 'Minutes') {
        convertedValue *= 60;
      } else if (outputUnit == 'Days') {
        convertedValue /= 24;
      }
    } else if (inputUnit == 'Days') {
      if (outputUnit == 'Seconds') {
        convertedValue *= 86400;
      } else if (outputUnit == 'Minutes') {
        convertedValue *= 1440;
      } else if (outputUnit == 'Hours') {
        convertedValue *= 24;
      }
    }

    setState(() {
      result = '$inputValue $inputUnit is converted to $convertedValue $outputUnit';
    });
  }
}
