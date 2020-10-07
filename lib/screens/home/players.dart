import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_team/models/Player.dart';
import 'package:cricket_team/screens/home/player_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cricket_team/services/database.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Player>>.value(
      value: DatabaseService().team,
      child: PlayerList(),
    );
  }
}

class PlayerList extends StatefulWidget {
  @override
  _PlayerListState createState() => _PlayerListState();
}

class _PlayerListState extends State<PlayerList> {
  @override
  Widget build(BuildContext context) {
    final players = Provider.of<List<Player>>(context);
    players.forEach((player) {
      print(player.name);
      print(player.type);
      print(player.age);
    });
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: players.length,
        itemBuilder: (context, index) {
          return PlayerCard(player: players[index]);
        });
  }
}
