import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: ExpansionCard(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    trailing:
                        Icon(Icons.more_vert_rounded, color: Colors.black),
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
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            Column(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: ExpansionCard(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    trailing:
                        Icon(Icons.more_vert_rounded, color: Colors.black),
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
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            Column(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: ExpansionCard(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    trailing:
                        Icon(Icons.more_vert_rounded, color: Colors.black),
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
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
