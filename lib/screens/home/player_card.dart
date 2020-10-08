import 'package:cricket_team/models/Player.dart';
import 'package:cricket_team/services/auth.dart';
import 'package:cricket_team/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  PlayerCard({this.player});

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final DatabaseService _data = DatabaseService();
    return Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Name'),
                SizedBox(
                  width: 5,
                ),
                Text(player.name),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Type'),
                SizedBox(
                  width: 5,
                ),
                Text(player.type),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Age'),
                SizedBox(
                  width: 5,
                ),
                Text(player.age.toString()),
              ],
            )
          ],
        ),
        FlatButton(onPressed: () async {}, child: Text('Delete'))
      ]),
    );
  }
}
