import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class RunningStopwatch extends StatefulWidget {
  @override
  _RunningStopwatchState createState() => _RunningStopwatchState();
}

class _RunningStopwatchState extends State<RunningStopwatch> {
  Stopwatch watch = Stopwatch();
  Timer timer;

  String elapsedTime = '00:00:00';

  int _selectedIndex = 0;
  void setTimerButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _timerButtons = [
      ButtonTheme(
        // minWidth: 100,
        // height: 20,
        child: RaisedButton(
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),

          elevation: 5.0,
          onPressed: () {
            startWatch();
            setTimerButton(1);
          },
          // child: Icon(Icons.play_arrow, color: Colors.white),
          child: Text(
            'Start',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
      RaisedButton(
        color: Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        elevation: 5.0,
        onPressed: () {
          startWatch();
          setTimerButton(1);
        },
        child: Icon(Icons.play_arrow, color: Colors.white),
      ),
      RaisedButton(
        color: Colors.red,
        elevation: 5.0,
        onPressed: () {
          stopWatch();
          setTimerButton(2);
        },
        child: Icon(Icons.pause_outlined, color: Colors.white),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            color: Colors.green,
            elevation: 5.0,
            onPressed: () {
              startWatch();
              setTimerButton(1);
            },
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
          SizedBox(width: 20),
          RaisedButton(
            color: Colors.blue,
            elevation: 5.0,
            onPressed: () {
              resetWatch();
              setTimerButton(0);
            },
            child: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      )
    ];
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            elapsedTime,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: 72,
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
          SizedBox(height: 20.0),
          _timerButtons.elementAt(_selectedIndex),
        ],
      ),
    );
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  startWatch() {
    watch.start();
    timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  resetWatch() {
    watch.reset();
    setTime();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
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
}
