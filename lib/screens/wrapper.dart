import 'package:cricket_team/screens/authenticate/autheticate.dart';
import 'package:cricket_team/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //return either home or authenticate widget
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
