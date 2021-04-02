import 'package:fit_me/Screens/Days.dart';
import 'package:flutter/material.dart';
import 'Screens/DrawerScreen.dart';
import 'Screens/Exercise_Screen.dart';
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
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            Days(),
          ],
        ),
      ),
      routes: {
        Days.ScreenID:(context)=>Days(),
        exerciseScreen.sID:(context)=>exerciseScreen(),
      },
    );
  }
}

