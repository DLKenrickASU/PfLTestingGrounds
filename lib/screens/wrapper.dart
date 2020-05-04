import 'package:flutter/material.dart';
import 'package:pflhome/models/user.dart';
import 'package:pflhome/screens/home/home.dart';
import 'package:pflhome/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home our authenticate
    if (user == null) {
    return Authenticate();
    }else{
      return Home();
    }
  }
}