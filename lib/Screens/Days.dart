import 'dart:convert';
import 'package:fit_me/API/arguments.dart';
import 'package:fit_me/configration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../API/API.dart';
import 'package:fit_me/logoTeller.dart';

class Days extends StatefulWidget {
  static String ScreenID = '/daysschedule';
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  List<Widget> Exercise_Listing = [];
  double xOffSet=0,yOffSet=0,saleFactor=1;
  @override
  void initState() {
    super.initState();
    initThisWidget();
  }
  Future<void> initThisWidget() async {
    var date = DateTime.now();
    String WeekDay =
        DateFormat('EEEE').format(date); //First Letter Capital like Sunday
    var client = http.Client();
    var response =
        await client.get(Get_Exercise('Wednesday')); // Add your Own API here
    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body);
      for (int i = 0; i < temp.length; ++i) {
        Exercise_Listing.add(Exercise(
          Exercise_Name: temp[i]['exercise_name'],
          Number_of_Reps: temp[i]['reps'],
          Number_Of_Sets: temp[i]['sets'],
          Logo: LogoTeller(temp[i]['exercise_name']), //ToDo: Add more Logos
        ));
      }
    }
    setState(() {});
  }
  var ic = Icons.menu;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(isDrawerOpen?25:0)
      ),
      transform: Matrix4.translationValues(xOffSet, yOffSet, 0)..scale(saleFactor),
      duration: Duration(milliseconds: 350),
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(xOffSet==0){
                          xOffSet = 230;
                          yOffSet = 150;
                          isDrawerOpen = true;
                          saleFactor = 0.6;
                          ic = Icons.close;
                        }
                        else{
                          xOffSet = 0;
                          yOffSet = 0;
                          isDrawerOpen = false;
                          saleFactor = 1;
                          ic = Icons.menu;
                        }
                      });
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1
                          ),
                          color: Color(0xFF045300),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        ic,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                    "Flex Gym",
                    style:TextStyle(
                        fontSize: 40
                    )
                ),
                ClipRRect(
                    child: Image(
                      image: AssetImage('assets/man.png'),
                      height: 50,
                      width: 50,
                    ),
                    borderRadius: BorderRadius.circular(30))
              ],
            ),
            Greeting(),
            CentralCard(),
            Text("Todays Exercises",
              style: TextStyle(
                  fontSize: 35,
                  color: Color(0xFF718977)
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Exercise_Listing.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Exercise_Listing[index];
                },
              ),
            )
          ],
        ),
      ),
    );

  }

  Container Greeting() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Hello Raghav",
              style: TextStyle(fontSize: 25,color: Color(0xFF718977)),
            ),
          ),
        ],
      ),
    );
  }
}

