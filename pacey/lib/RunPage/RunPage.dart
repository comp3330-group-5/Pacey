import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Navigation.dart';

class RunPage extends StatefulWidget {
  const RunPage({Key key}) : super(key: key);

  @override
  _RunPageState createState() => _RunPageState();
}

class _RunPageState extends State<RunPage> {
  // stopwatch component
  Stopwatch watch = Stopwatch();
  Timer timer;
  String elapsedTime = '00:00:00';
  bool _started = false;
  bool _running = false;
  int _selectedIndex = 0;

  void setStarted(bool started) {
    setState(() {
      _started = started;
    });
  }

  void setRunning(bool running) {
    setState(() {
      _running = running;
    });
  }

  void updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  void startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
  }

  void stopWatch() {
    watch.stop();
    setTime();
  }

  void resetWatch() {
    watch.reset();
    setTime();
  }

  void setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  String transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 60).toString().padLeft(2, '0');

    if (hours < 1)
      return "$minutesStr:$secondsStr.$hundredsStr";
    else
      return "$hoursStr:$minutesStr:$secondsStr";
  }

  // map component
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> _timerButtons = [
      // start button
      Container(
        width: 120,
        child: FloatingActionButton.extended(
          onPressed: () {
            startWatch();
            setStarted(true);
            setRunning(true);
          },
          label: Text('Start'),
          icon: Icon(Icons.play_arrow),
          backgroundColor: Colors.green,
        ),
      ),
      // pause button
      Container(
        width: 120,
        child: FloatingActionButton.extended(
          onPressed: () {
            stopWatch();
            setRunning(false);
          },
          label: Text('Pause'),
          icon: Icon(Icons.pause_outlined),
          backgroundColor: Colors.green,
        ),
      ),
      // resume button
      Container(
        width: 120,
        child: FloatingActionButton.extended(
          onPressed: () {
            startWatch();
            setStarted(true);
            setRunning(true);
          },
          label: Text('Resume'),
          icon: Icon(Icons.play_arrow),
          backgroundColor: Colors.green,
        ),
      ),
      // end button
      Container(
        width: 120,
        child: FloatingActionButton.extended(
          onPressed: () {
            stopWatch();
            // setStarted(true);
            // setRunning(true);
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => Navigation(),
              ),
            );
          },
          label: Text('Stop'),
          icon: Icon(Icons.stop),
          backgroundColor: Colors.red,
        ),
      ),
    ];
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
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    elapsedTime,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 56,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    'Duration',
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 8,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: _started
            ? [
                Row(
                  children: _running
                      ? [
                          _timerButtons[1],
                        ]
                      : [
                          _timerButtons[2],
                          SizedBox(width: 10),
                          _timerButtons[3],
                        ],
                ),
              ]
            : [_timerButtons[0]],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
