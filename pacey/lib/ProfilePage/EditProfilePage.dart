import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _profileKey = GlobalKey<FormState>();
  bool _maleSelected = false;
  bool _femaleSelected = false;
  String _username, _gender, _age, _weight, _height;
  // TextEditingController _username = TextEditingController();

  Future<void> fillForm(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> retrieveForm() async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('name');
    String gender = prefs.getString('gender');
    String age = prefs.getString('age');
    String weight = prefs.getString('weight');
    String height = prefs.getString('height');

    setState(() {
      _username = username;
      _gender = gender;
      if (_gender == 'male') _maleSelected = true;
      if (_gender == 'female') _femaleSelected = true;
      _age = age;
      _weight = weight;
      _height = height;
    });
  }

  @override
  void initState() {
    super.initState();
    retrieveForm();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black87,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text('Discard Changes?'),
                actions: [
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                elevation: 24,
                backgroundColor: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Form(
        key: _profileKey,
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: TextEditingController(text: _username),
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
                controller: TextEditingController(text: _age),
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
                controller: TextEditingController(text: _weight),
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
                controller: TextEditingController(text: _height),
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
          onPressed: () {
            if (_profileKey.currentState.validate()) {
              if (_maleSelected) {
                fillForm('gender', 'male');
              } else if (_femaleSelected) {
                fillForm('gender', 'female');
              }
              _profileKey.currentState.save();
              Navigator.pop(context);
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
