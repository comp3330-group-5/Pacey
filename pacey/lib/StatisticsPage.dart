import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Database.dart';
class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  String _runs = '';

  Future<void> getRuns() async {

    List<Map<String, dynamic>> runs = await dbHelper.queryAllRowsRun();

    setState(() {
      _runs = runs.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    getRuns();
    return Container(
      margin: EdgeInsets.all(100),
      child: Text(
        _runs.toString(),
        style: GoogleFonts.roboto(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
    );
  }
}
