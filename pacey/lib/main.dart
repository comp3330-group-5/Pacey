import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:pacey/ProfilePage/NewProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Navigation.dart';

void main() => runApp(Pacey());

class Pacey extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacey',
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => Navigation()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => NewProfilePage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
