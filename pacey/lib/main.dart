import 'package:flutter/material.dart';
import 'package:pacey/ProfilePage/NewProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Navigation.dart';

void main() => runApp(Pacey());

class Pacey extends StatelessWidget {
  bool isNewUser = false;
  Future<void> checkNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    int val = prefs.getInt('isNewUser');
    if (val == null) isNewUser = true;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacey',
      home: isNewUser ? Navigation() : NewProfilePage(),
    );
  }
}
