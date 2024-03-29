import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Database.dart';
import 'EditProfilePage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  DateTime selectedDate = DateTime.now();
  String _username, _gender, _age, _weight, _height;
  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  Future<void> retrieveForm() async {
    // ignore: unnecessary_statements
    '''
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('name');
    String gender = prefs.getString('gender');
    String age = prefs.getString('age');
    String weight = prefs.getString('weight');
    String height = prefs.getString('height');
    ''';

    final profile = await dbHelper.getProfile();

    String username = profile['name'];
    String gender = profile['gender'];
    String age = profile['age'];
    String weight = profile['weight'];
    String height = profile['height'];

    setState(() {
      _username = username;
      _gender = gender;
      _age = age;
      _weight = weight;
      _height = height;
    });
  }

  @override
  Widget build(BuildContext context) {
    retrieveForm();
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
      body: Card(
        margin: EdgeInsets.all(20),
        child: Container(
          height: 230,
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  '$_username',
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.wc_rounded, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          'Gender: ',
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: _gender == 'male' || _gender == 'female'
                        ? Container(
                            child: _gender == 'male'
                                ? Text('Male',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                    ))
                                : Text('Female',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                    )),
                          )
                        : null,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_rounded, color: Colors.blue),
                        SizedBox(width: 5),
                        Text(
                          'Age: ',
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$_age',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        ' yo',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.fitness_center_rounded,
                            color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          'Weight: ',
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.orange,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$_weight',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        ' kg',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 120,
                    child: Row(
                      children: [
                        Icon(Icons.height_rounded, color: Colors.pink),
                        SizedBox(width: 5),
                        Text(
                          'Height: ',
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.pink,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$_height',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        ' cm',
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.black87,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Edit'),
        icon: Icon(Icons.edit_rounded),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage()),
        ),
      ),
    );
  }
}
