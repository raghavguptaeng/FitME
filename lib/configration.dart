import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; //good font
import 'API/arguments.dart';
import 'Screens/Exercise_Screen.dart';

//---------------- Method To Generate Top card on home Screen -----
class CentralCard extends StatelessWidget {
  const CentralCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF3CAFAC), borderRadius: BorderRadius.circular(15)),
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
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFF718977),
                            border: Border.all(color: Colors.black,width: 3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
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
//---------------- Method To Generate Exercise List  --------------
class Exercise extends StatelessWidget {
  final String Exercise_Name;
  final String Number_Of_Sets;
  final String Number_of_Reps;
  final String Logo;
  Exercise(
      {this.Exercise_Name,
        this.Number_Of_Sets,
        this.Number_of_Reps,
        this.Logo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, exerciseScreen.sID,
            arguments: exerciseDataArguments(Logo, Exercise_Name));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              //height: 70,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF01B017),
                  ),
                  color: Color(0xFF01B017),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    child: Image(
                      image: NetworkImage(
                          'http://raghavgupta.ninja/API/FitMe/Images/' + Logo),
                      width: 35,
                      height: 35,
                    ),
                    tag: Exercise_Name,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 150,
                      child: Text(
                        Exercise_Name,
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    child: Text(
                      "${Number_Of_Sets} Sets",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(width: 45, child: Text("${Number_of_Reps} Reps"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
//---------------- Method To Generate Weight List for picker ------
List<Widget> addWeight(){
  List<Widget> lst = [];
  double j=2.5;
  for(double i=2.5 ; i<=40 ; i+=j){
    lst.add(
        Expanded(
          child: Container(
            child: Text(
              (i).toString() + ' Kg',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        )
    );
  }
  return lst;
}