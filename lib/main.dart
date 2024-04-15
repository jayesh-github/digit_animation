import 'dart:async';
import 'dart:math';

import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Animated Digit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _randomNumber;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
    // Start a timer to update the random number every second
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      _generateRandomNumber();
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void _generateRandomNumber() {
    setState(() {
      // Generate a random number (between 0 and 999 for example)
      _randomNumber = Random().nextInt(1000000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedDigitWidget(
              key: const Key("ads"),
              value: _randomNumber,
              textStyle: const TextStyle(
                color: Colors.purple,
                fontSize: 50,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              curve: Curves.easeOutCubic,
              duration: const Duration(milliseconds: 400),
              enableSeparator: true,
              separateSymbol: ",",
              fractionDigits: 0,
            )
          ],
        ),
      ),
    );
  }
}
