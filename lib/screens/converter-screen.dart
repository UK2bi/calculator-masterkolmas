import 'package:flutter/material.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _kmController = TextEditingController();
  double _miles = 0;

  void _convert() {
    setState(() {
      _miles = double.parse(_kmController.text) * 0.621371;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kilometer to Miles Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _kmController,
              decoration: const InputDecoration(
                labelText: 'Kilometers',
                hintText: 'Enter kilometers to convert',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Miles: ${_miles.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}

