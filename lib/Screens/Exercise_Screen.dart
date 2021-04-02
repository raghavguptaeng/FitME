import 'package:fit_me/API/arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit_me/configration.dart';

class exerciseScreen extends StatefulWidget {
  static String sID = 'exercise Screen';
  @override
  _exerciseScreenState createState() => _exerciseScreenState();
}

class _exerciseScreenState extends State<exerciseScreen> {
  @override
  Widget build(BuildContext context) {
    final exerciseDataArguments args =
        ModalRoute.of(context).settings.arguments;
    //----
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: args.name,
              child: Image(
                image: NetworkImage(
                    'http://raghavgupta.ninja/API/FitMe/Images/' + args.logo),
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.40,
              ),
            ),
          ),
          Text(
            args.name,
            style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Color(0xFF967BB6)),
          ),
          CupertinoPicker(
              itemExtent: 50, //height of each item
              looping: true,
              onSelectedItemChanged: (int index) {
                //selectitem = index;
              },
              children:addWeight() as List
          ),
          TextButton(
              onPressed: () {
                print('skip'); //toDO:Add Exerccise Skip Option;
              },
              child: Text("Skip Exercise"))
        ],
      ),
    );
  }
}
