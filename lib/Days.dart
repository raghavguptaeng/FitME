import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'API/API.dart';
class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  List<Widget> Exercise_Listing = [];
  @override
  void initState() {
    initThisWidget();
    super.initState();
  }
  Future<void> initThisWidget() async {
    var date = DateTime.now();
    String WeekDay = DateFormat('EEEE').format(date); //First Letter Capital like Sunday
    var client = http.Client();
    var response = await client.get(Get_Exercise(WeekDay)); // Add your Own API here
    if(response.statusCode==200){
      var temp = jsonDecode(response.body);
      for(int i=0 ; i<temp.length ; ++i){
        Exercise_Listing.add(
          Exercise(
            Exercise_Name: temp[i]['exercise_name'],
            Number_of_Reps: temp[i]['reps'],
            Number_Of_Sets: temp[i]['sets'],
            Logo: "Barble.png", //ToDo: Change Logo Corresponding To Exercise
          )
        );
      }
    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
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
      ),
      body: Column(
        children: [
          Greeting(),
          SubLine(),
          CentralCard(),
          Container(
            width: 200,
            child: Text(
                "Today's Exercises",
              style: TextStyle(
                color: Color(0xFF572C57),
                fontSize: 40,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Exercise_Listing.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return Exercise_Listing[index];
              },
            ),
          )
        ],
      ),
    );
  }

  Container Greeting() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Hello Raghav",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ],
      ),
    );
  }
}

class Exercise extends StatelessWidget {

  final String Exercise_Name;
  final String Number_Of_Sets;
  final String Number_of_Reps;
  final String Logo;
  Exercise({this.Exercise_Name,this.Number_Of_Sets,this.Number_of_Reps,this.Logo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            //height: 70,
            decoration: BoxDecoration(
              border:Border.all(
                color: Color(0xFF899991),
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage('assets/${Logo}'),width: 25,height: 25,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 200,
                    child: Text(
                        Exercise_Name,
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF967BB6),
                      ),
                    ),
                  ),
                ),
                Container(
                  width:45,
                  child: Text(
                      "${Number_Of_Sets} Sets",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    width: 45,
                    child: Text("${Number_of_Reps} Reps"))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SubLine extends StatelessWidget {
  const SubLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "I Hope You Have A nice Day",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class CentralCard extends StatelessWidget {
  const CentralCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        //height: 75,
        decoration: BoxDecoration(
            color: Color(0xFF52489A), borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                width: 250,
                child: Text(
                  "Your Weekly Progress",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
