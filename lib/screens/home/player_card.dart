import 'package:cricket_team/models/Player.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  PlayerCard({this.player});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
      child: Column(
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
    );
  }
}
