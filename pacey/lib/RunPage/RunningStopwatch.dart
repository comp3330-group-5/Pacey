import 'package:flutter/material.dart';
import 'dart:async';

class RunningStopwatch extends StatefulWidget {
  @override
  _RunningStopwatchState createState() => _RunningStopwatchState();
}

class _RunningStopwatchState extends State<RunningStopwatch> {
  Stopwatch watch = Stopwatch();
  Timer timer;

  String elapsedTime = '00:00:00';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            elapsedTime,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 64,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: startWatch,
                  child: Icon(Icons.play_arrow)),
              SizedBox(width: 20.0),
              FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: stopWatch,
                  child: Icon(Icons.stop)),
              SizedBox(width: 20.0),
              FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: resetWatch,
                  child: Icon(Icons.refresh)),
            ],
          )
        ],
      ),
    );
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

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hoursStr = (hours % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}
