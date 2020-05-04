import 'package:flutter/material.dart';
import 'package:pflhome/models/goal.dart';
import 'package:provider/provider.dart';
import 'package:pflhome/screens/home/goal_tile.dart';

class GoalList extends StatefulWidget {
  @override
  _GoalListState createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  @override
  Widget build(BuildContext context) {

    final goals = Provider.of<List<Goal>>(context) ?? [];

    return ListView.builder(
      itemCount: goals.length,
      itemBuilder: (context, index) {
        return GoalTile(goal: goals[index]);
      },
    );
  }
}