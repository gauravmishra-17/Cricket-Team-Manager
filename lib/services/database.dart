import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cricket_team/models/Player.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference teamCollection =
      FirebaseFirestore.instance.collection('Team');

  Future updatePlayer(String name, String type, int age) async {
    return await teamCollection.doc(uid).set({
      'Name': name,
      'Type': type,
      'Age': age,
    });
  }

  Future deletePlayer() async {
    return await teamCollection.doc(uid).delete();
  }

  List<Player> _playerListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Player(
        name: doc.get('Name'),
        type: doc.get('Type'),
        age: doc.get('Age'),
      );
    }).toList();
  }

  Stream<List<Player>> get team {
    return teamCollection.snapshots().map(_playerListFromSnapshot);
  }
}
