import 'package:flutter/material.dart';

import '../controller/logic.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final calcLogic = CalculatorLogic();

  buttonPressed(String buttonText){
    calcLogic.buttonPressed(buttonText);
    setState(() {
      calcLogic.postOutput = double.parse(calcLogic.preOutput).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 0, 0),),
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),

        ),



        body: Column(
          children: <Widget>[

            Container(alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Column(
              children: [
                Text(calcLogic.postOutput,
                    style: const TextStyle(
                        fontSize: 48.0, fontWeight: FontWeight.bold)),
                Text(calcLogic.equationStack.join(" "),
                    style: const TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.normal)),
              ],
            )),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/converter');
            },
              child: const Text('Converter screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              child: const Text('History'),
            ),
            const Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ]),
              Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("X")
              ]),
              Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ]),
              Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")
              ]),
              Row(children: [buildButton("CLEAR"), buildButton("=")]),
            ])
          ],
        ));
  }
}