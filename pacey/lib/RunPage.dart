import 'package:flutter/material.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'pacey',
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 36,
              color: Colors.black87,
            ),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  // Stopwatch(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Dst'),
                      Text('Cal'),
                      Text('Spd'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [],
              ),
            ],
          ),
        ));
  }
}
