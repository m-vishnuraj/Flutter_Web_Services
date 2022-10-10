import 'package:flutter/material.dart';
import 'package:http_sample/apis.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenHome(),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final numberInputController = TextEditingController();

  String resultText = 'Type Number and Press get result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: numberInputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a number',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final number = numberInputController.text;
                  final result = await getNumberFact(number: number);
                  print(result.text);
                  setState(() {
                    resultText = result.text ?? 'No result';
                  });
                  // if (number.isNotEmpty) {

                  // }
                  // return;
                },
                child: const Text('Get Result'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(resultText),
            ],
          ),
        ),
      ),
    );
  }
}
