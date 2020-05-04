import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pflhome/screens/home/settings_form.dart';
import 'package:pflhome/services/auth.dart';
import 'package:pflhome/services/database.dart';
import 'package:provider/provider.dart';
import 'package:pflhome/screens/home/goal_list.dart';
import 'package:pflhome/models/goal.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showCupertinoDialog(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: Material(child: SettingsForm()),
        );
      },);
    }


    return StreamProvider<List<Goal>>.value(
      value: DatabaseService().goals,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Psych for Life'),
          backgroundColor: Colors.blue[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log Out'),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('Settings')
              )
          ],
        ),
        body: GoalList()
      ),
    );
  }
}
