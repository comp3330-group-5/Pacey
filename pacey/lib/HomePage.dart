import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pacey/RunPage/RunPage.dart';
import 'RunPage/RunningMap.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
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
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '0.00',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 56,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        ' km',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w300,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'distance of the week',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 130,
                    height: 50,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RunPage(),
                          ),
                        );
                      },
                      label: Text(
                        'RUN NOW',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  // ButtonTheme(
                  //   minWidth: 130,
                  //   height: 50,
                  //   child: RaisedButton(
                  //     color: Colors.green,
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25.0)),
                  //     elevation: 5.0,
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => RunPage(),
                  //         ),
                  //       );
                  //     },
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         // Icon(Icons.play_arrow, color: Colors.white),
                  //         Text(
                  //           'RUN NOW',
                  //           style: GoogleFonts.roboto(
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Material(
              elevation: 0,
              child: RunningMap(),
            ),
          ),
        ],
      ),
    );
  }
}
