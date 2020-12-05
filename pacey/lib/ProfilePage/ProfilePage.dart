import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'EditProfilePage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      helpText: 'Select your birthday',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage()),
        ),
      ),
    );
  }
}
