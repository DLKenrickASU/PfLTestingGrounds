import 'package:flutter/cupertino.dart';
import 'package:pflhome/models/goal.dart';
import 'package:flutter/material.dart';
import 'package:pflhome/screens/home/settings_form.dart';

class GoalTile extends StatelessWidget {

  final Goal goal;
  GoalTile({ this.goal });


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

    return Card(margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 5.0),
        ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[200],
            ),
            title: Text(goal.name),
            subtitle: Text('Today I will ${goal.goal} for ${(goal.goalDuration/60000)} minutes'),
        ),
        ButtonBar(children: <Widget>[
          RaisedButton(onPressed: () => _showSettingsPanel(), child: Text('Edit')),
          RaisedButton(onPressed: null, child: Text('Join')),
          RaisedButton(onPressed: null, child: Text('Encourage')),
        ])
      ],
    ),
    );
  }
}

    