import 'package:cricket_team/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  //email and password values
  String email = "";
  String password = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in to know the team')),
      body: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val.isEmpty ? 'Enter your Email' : null,
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
              RaisedButton(
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result =
                        await _auth.signinWithEmailAndPassword(email, password);
                    if (result == null)
                      setState(() {
                        error = 'Player not in the team';
                      });
                  }
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 20.0),
              Text(error),
            ],
          )),
    );
  }
}
