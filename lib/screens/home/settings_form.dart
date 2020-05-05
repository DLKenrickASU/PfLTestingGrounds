import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pflhome/models/user.dart';
import 'package:pflhome/screens/home/timer_page.dart';
import 'package:pflhome/services/database.dart';
import 'package:pflhome/shared/constants.dart';
import 'package:pflhome/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> wills = ['I will', 'I will only', 'I will not'];

  String _currentName;
  String _currentGoal;
  int _currentGoalDuration;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
 

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Text('Update your goal settings.',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 20.0),
                  Text('Name'),
                  //SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  Text('Today I will'),
                  TextFormField(
                    initialValue: userData.goal,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a goal' : null,
                    onChanged: (val) => setState(() => _currentGoal = val),
                  ),
                  SizedBox(height: 20.0),
                  Text('for'),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 80,
                    width: 250,
                    child: CupertinoTimerPicker(mode: CupertinoTimerPickerMode.hm, initialTimerDuration: Duration (milliseconds: userData.goalDuration), onTimerDurationChanged: (duration) {
                      setState(() {
                        _currentGoalDuration = duration.inMilliseconds;
                      });
                    }),
                  ),
                  //SizedBox(
                  //  height: 150,
                  //  width: 250,
                    //child: TimerPage(),
                 // ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text('Update',
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          print('Awaiting');
                          await DatabaseService(uid: user.uid).updateUserData(
                            _currentName ?? userData.name,
                            _currentGoal ?? userData.goal,
                            _currentGoalDuration ?? userData.goalDuration,
                          );
                          print('Arrived');
                          Navigator.pop(context);
                          print('popped');
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
