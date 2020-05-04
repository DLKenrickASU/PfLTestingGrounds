import 'package:flutter/material.dart';
import 'package:pflhome/models/user.dart';
import 'package:pflhome/screens/wrapper.dart';
import 'package:pflhome/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
            home: Wrapper(),
      ),
    );
  }
}
