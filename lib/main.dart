import 'package:fit_me/Days.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Begin());
}
class Begin extends StatefulWidget {
  @override
  _BeginState createState() => _BeginState();
}

class _BeginState extends State<Begin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>Days(),
      },
      initialRoute: '/',
    );
  }
}
