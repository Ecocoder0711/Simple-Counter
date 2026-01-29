import 'package:counter_app/screen/simplecounter.dart';
import 'package:flutter/material.dart';

class Runapp extends StatelessWidget {
  const Runapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Counter",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}