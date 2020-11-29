import 'package:flutter/material.dart';
import './Navigation.dart';

void main() => runApp(Pacey());

class Pacey extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacey',
      home: Navigation(),
    );
  }
}
