import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Navigation.dart';

class NewProfilePage extends StatefulWidget {
  NewProfilePage({Key key}) : super(key: key);

  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  final _profileKey = GlobalKey<FormState>();
  bool _maleSelected = false;
  bool _femaleSelected = false;

  Future<void> fillForm(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to Pacey!',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Form(
        key: _profileKey,
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please provide your information below before we start:',
                style: GoogleFonts.roboto(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              // SizedBox(height: 10),
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: const InputDecoration(
                  labelText: 'Name *',
                ),
                onSaved: (String value) {
                  fillForm('name', value);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today_rounded, color: Colors.blue),
                  labelText: 'Age *',
                ),
                onSaved: (String value) {
                  fillForm('age', value);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
                decoration: const InputDecoration(
                  icon:
                      Icon(Icons.fitness_center_rounded, color: Colors.orange),
                  labelText: 'Weight (in kg) *',
                ),
                onSaved: (String value) {
                  fillForm('weight', value);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.height_rounded, color: Colors.pink),
                  labelText: 'Height (in cm) *',
                ),
                onSaved: (String value) {
                  fillForm('height', value);
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'This field cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        child: FloatingActionButton.extended(
          onPressed: () async {
            if (_profileKey.currentState.validate()) {
              if (_maleSelected) {
                fillForm('gender', 'male');
              } else if (_femaleSelected) {
                fillForm('gender', 'female');
              }
              _profileKey.currentState.save();
              final prefs = await SharedPreferences.getInstance();
              prefs.setInt('isNewUser', 1);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Navigation()));
            }
          },
          label: Text('Save'),
          icon: Icon(Icons.done_rounded),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
