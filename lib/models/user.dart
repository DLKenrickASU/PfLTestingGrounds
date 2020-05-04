import 'package:flutter/material.dart';

class User {
  final String uid;

  User({ this.uid });

}

class UserData {
  final String uid;
  final String name;
  final String goal;
  final int goalDuration;

  UserData({ this.uid, this.name, this.goal, this.goalDuration});

}