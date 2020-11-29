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
              fontSize: 34,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: RunningStopwatch(),
            ),
          ],
        ),
      ),
    );
  }
}
