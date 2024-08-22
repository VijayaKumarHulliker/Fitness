
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/view/detail.dart';
import 'package:fitness/view/my_appoinments.dart';
import 'package:flutter/material.dart';
import 'package:fitness/viewmodel/ui.dart'; // Import ItemCard

class MyAssessment extends StatelessWidget {
  const MyAssessment({super.key});

  @override
  Widget build(BuildContext context) {
     final List<String> imagePaths=[
    'assets/images/sweat.png',
    'assets/images/pushup.png',
    
  
  ];

   final List<String> titles = [
    
    'Sweat Starter',
    'Push-up Exercise',
  ];

  final List<String> subtitles = [
    'Full Body',
    'Cheast',
  ];
  final List<String> use = [
    'Lose Weight',
    'Bulk Cheast',
  ];
  final List<String> difficulty = [
    'Medium',
    'Hard',
  ];
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('items').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        // Convert snapshot to a list and skip the first item
        List<DocumentSnapshot> docs = snapshot.data!.docs;
        List<DocumentSnapshot> itemsToShow = docs.skip(1).toList();

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children:[ ...itemsToShow.map((doc) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail()));
                },
                child: ItemCard(
                  imageUrl: doc['imageUrl'],
                  title: doc['title'],
                  description: doc['description'],
                ),
              );
            }).toList(),
            SizedBox(height: 10,),

            Viewallbutton(),

            SizedBox(height: 20.0),

            Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Challenges"),
                    Spacer(),
                    Row(
                      children: [
                        Text("View all"),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_circle_right_rounded),
                      ],
                    ),
                  ],
                ),

            SizedBox(height: 10,),

            
            challange(),

            SizedBox(height: 10,),

            workoutheading(),
            //SizedBox(height: 20,),

         

    WorkoutRoutines(imagePaths: imagePaths, titles: titles, subtitles: subtitles, use: use, difficulty: difficulty)
,
              ],
          
          
          ),
        );
      },
    );
  }
}
