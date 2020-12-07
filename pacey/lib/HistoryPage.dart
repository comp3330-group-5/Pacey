import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Database.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;
  int _itemCount = 0;
  List<Map<String, dynamic>> _runs;

  Future<void> getRun() async {
    int itemCount = await dbHelper.queryRowCountRun();
    List<Map<String, dynamic>> runs = await dbHelper.queryAllRowsRun();

    setState(() {
      _itemCount = itemCount;
      _runs = runs;
    });
  }

  @override
  Widget build(BuildContext context) {
    getRun();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 28,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
<<<<<<< Updated upstream
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
=======
        child: ListView.builder(itemCount: _itemCount, itemBuilder: (context, index) {
          return Column(
            children: [
              Column(
>>>>>>> Stashed changes
                children: [
                  Column(
                    children: [
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: ExpansionCard(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          trailing: Icon(Icons.more_vert_rounded,
                              color: Colors.black),
                          title: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("7/12/2020",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87)),
                                SizedBox(height: 5),
                                Text("From Kennedy Town, Praya",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87)),
                                SizedBox(height: 5),
                                Text("To Des Voux W",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black87)),
                              ],
                            ),
                          ),
                          children: <Widget>[

                            Container(
                              width: 300,
                              height: 60,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text("Duration",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87)),
                                      SizedBox(height: 5),
                                      Text("00:25:00",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Consumed",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87)),
                                      SizedBox(height: 5),
                                      Text("1000 cal",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text("Avg. Speed",
                                          style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87)),
                                      SizedBox(height: 5),
                                      Text("5 min/km",
                                          style: GoogleFonts.roboto(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
=======
                            Text(_runs[index]['date'],
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87)),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 60,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text("Duration",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87)),
                                  SizedBox(height: 5),
                                  Text(_runs[index]['duration'],
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Consumed",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87)),
                                  SizedBox(height: 5),
                                  Text(_runs[index]['consumed'].toString() + " cal",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text("Avg. Speed",
                                      style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87)),
                                  SizedBox(height: 5),
                                  Text(_runs[index]['speed'].toString() + " min/km",
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87)),
                                ],
                              ),
                            ],
                          ),
>>>>>>> Stashed changes
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              );
            }),
      ),
    );
  }
}
