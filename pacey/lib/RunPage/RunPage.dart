import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Navigation.dart';
import './RunningStopwatch.dart';
import './RunningMap.dart';

class RunPage extends StatelessWidget {
  const RunPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Stopwatch',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Navigation()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: RunningStopwatch(),
          ),
          Flexible(
            flex: 6,
            child: RunningMap(),
          ),
        ],
      ),
    );
  }
}
