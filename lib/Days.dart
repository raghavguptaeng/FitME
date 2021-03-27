import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Exercise_Schedule.dart';
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
  void initThisWidget(){
    List temp  = Exercise_List[0] as List;
    print(temp);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
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
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Greeting(),
          SubLine(),
          CentralCard(),
          Column(
            children: [
              Exercise(
                Exercise_Name: "Treadmil",
                Number_of_Reps: 0,
                Number_Of_Sets: 0,
              ),
              Exercise(
                Exercise_Name: "Hammer Curs",
                Number_Of_Sets: 4,
                Number_of_Reps: 25,
              ),
              Exercise(
                Exercise_Name: "Situps",
                Number_Of_Sets: 4,
                Number_of_Reps: 15,
              ),
            ],
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
  final int Number_Of_Sets;
  final int Number_of_Reps;

  Exercise({this.Exercise_Name,this.Number_Of_Sets,this.Number_of_Reps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              border:Border.all(
                color: Colors.grey
              ),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      Exercise_Name,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Text(
                    "${Number_Of_Sets.toString()} Sets",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text("${Number_of_Reps.toString()} Reps")
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
        height: 75,
        decoration: BoxDecoration(
            color: Color(0xFF5447D7), borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Weekly Progress",
                style: TextStyle(color: Colors.white, fontSize: 30),
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
