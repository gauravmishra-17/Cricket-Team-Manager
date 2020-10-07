import 'package:cricket_team/screens/home/players.dart';
import 'package:cricket_team/services/auth.dart';
import 'package:cricket_team/services/database.dart';
import 'package:flutter/material.dart';

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";
  String error = "";
  String uid = "";
  String name = "";
  String type = "";
  int age;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email',
            ),
            validator: (val) => val.isEmpty ? "Enter player's Email" : null,
            onChanged: (val) {
              setState(() {
                email = val;
              });
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            validator: (val) =>
                val.length < 6 ? 'characters should be more than 5' : null,
            obscureText: true,
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Name',
            ),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Type',
            ),
            onChanged: (val) {
              setState(() {
                type = val;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Age',
            ),
            onChanged: (val) {
              setState(() {
                age = int.parse(val);
              });
            },
          ),
          RaisedButton(
              onPressed: () async {
                print("TAPPED");
                if (_formkey.currentState.validate()) {
                  dynamic result =
                      await _auth.createEmailandPassword(email, password);

                  if (result == null)
                    setState(() {
                      error = 'Player not in the team';
                    });
                  else {
                    uid = result;
                    await DatabaseService(uid: uid)
                        .updatePlayer(name, type, age);
                  }
                }
              },
              child: Text('Add Player')),
          Players(),
        ],
      ),
    );
  }
}
