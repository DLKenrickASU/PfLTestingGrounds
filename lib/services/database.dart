import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pflhome/models/goal.dart';
import 'package:pflhome/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference goalCollection = Firestore.instance.collection('goals');

  Future updateUserData(String name, String goal, int goalDuration) async {
    return await goalCollection.document(uid).setData({
      'name': name,
      'goal': goal,
      'goalDuration': goalDuration,
    });
  }

  // goal list from snapshot
  List<Goal> _goalListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Goal(
        name: doc.data['name'] ?? '',
        goal: doc.data['goal'] ?? '',
        goalDuration: doc.data['goalDuration'] ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      goal: snapshot.data['goal'],
      goalDuration: snapshot.data['goalDuration'],

    );
  }

  // get goals stream
  Stream<List<Goal>> get goals {
    return goalCollection.snapshots()
    .map(_goalListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return goalCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }

}