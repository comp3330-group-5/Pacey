import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _maleSelected = false;
  bool _femaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ),
        leading: BackButton(color: Colors.black87),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.wc_rounded, color: Colors.green),
                SizedBox(width: 16),
                ChoiceChip(
                  selected: _maleSelected,
                  label: Text('Male'),
                  onSelected: (bool selected) {
                    setState(() {
                      _maleSelected = true;
                      _femaleSelected = false;
                    });
                  },
                ),
                SizedBox(width: 10),
                ChoiceChip(
                  selected: _femaleSelected,
                  label: Text('Female'),
                  onSelected: (bool selected) {
                    setState(() {
                      _maleSelected = false;
                      _femaleSelected = true;
                    });
                  },
                ),
              ],
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today_rounded, color: Colors.blue),
                labelText: 'Age *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.fitness_center_rounded, color: Colors.orange),
                labelText: 'Weight (in kg) *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.height_rounded, color: Colors.pink),
                labelText: 'Height (in cm) *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            SizedBox(height: 25),
            Container(
              width: 120,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: Text('Save'),
                icon: Icon(Icons.done_rounded),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
