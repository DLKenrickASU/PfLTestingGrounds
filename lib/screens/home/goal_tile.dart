import 'package:pflhome/models/goal.dart';
import 'package:flutter/material.dart';

class GoalTile extends StatelessWidget {

  final Goal goal;
  GoalTile({ this.goal });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(margin: EdgeInsets.fromLTRB(20, 6, 20, 20),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.blue[200],
          ),
          title: Text(goal.name),
          subtitle: Text('Today I will ${goal.goal} for ${(goal.goalDuration/60000)} minutes'),
      ),)
      );
  }
}