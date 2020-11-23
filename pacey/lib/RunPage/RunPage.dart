import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './RunningStopwatch.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'pacey',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 36,
                color: Colors.black87,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RunningStopwatch(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Dst'),
                  Text('Cal'),
                  Text('Spd'),
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
