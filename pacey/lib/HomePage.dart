import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pacey/RunPage/RunPage.dart';
import 'Database.dart';
import 'RunPage/RunningMap.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  String _totalDistance = '0.00';

  Future<void> getTotalDistance() async {

    String totalDistance = await dbHelper.getTotalDistanceRun();

    setState(() {
      _totalDistance = totalDistance;
    });
  }

  @override
  Widget build(BuildContext context) {
    getTotalDistance();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            _totalDistance,
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
                      ButtonTheme(
                        minWidth: 130,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 5.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RunPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(Icons.play_arrow, color: Colors.white),
                              Text(
                                'RUN NOW',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: RunningMap(),
          ),
        ],
      ),
    );
  }


}
