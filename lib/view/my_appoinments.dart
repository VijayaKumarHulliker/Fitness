import 'package:flutter/material.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({super.key});

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [ 
            
            Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 232, 246, 242),
                ),
                child: 
                Column(
                  children: [
                    GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [ 
                      Image.asset('assets/images/medical.png'),
                      Image.asset('assets/images/phisoyotherpi.png'),
                      Image.asset('assets/images/fitness.png'),
                  
                    ],
                    ),
                
                    SizedBox(height: 20,) ,

                    Viewallbutton(),
                  ]  
            ),
            ),
            SizedBox(height: 10,),

            viji(),

            SizedBox(height: 10,),

            challange(),
            
            SizedBox(height: 10,),

            workoutheading(),
            SizedBox(height: 10,),

         

    WorkoutRoutines(imagePaths: imagePaths, titles: titles, subtitles: subtitles, use: use, difficulty: difficulty)
,

             ],
        ),
      ),
    );
  }




  Row viji() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
          
         Text("Challanges"),
         Spacer(),
         Row(children: [ 
          Text("View all"),
          SizedBox(width: 5,),
          Icon(Icons.arrow_circle_right_rounded)
         ],)

        ],);
  }
}

class Viewallbutton extends StatelessWidget {
  const Viewallbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
     backgroundColor: Color.fromARGB(255, 3, 50, 88),
     foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
     child: const Text("View all"));
  }
}

class WorkoutRoutines extends StatelessWidget {
  const WorkoutRoutines({
    super.key,
    required this.imagePaths,
    required this.titles,
    required this.subtitles,
    required this.use,
    required this.difficulty,
  });

  final List<String> imagePaths;
  final List<String> titles;
  final List<String> subtitles;
  final List<String> use;
  final List<String> difficulty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
    height: 200, // Set a height for the ListView
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Container(
            width: 350, // Set a fixed width for the container
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey), // Grey border
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Row(
              children: [
                // Image on the left half
                Container(
                  width: 150, // Set half the width for the image
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ), // Rounded corners for the left side
                    child: Image.asset(
                      imagePaths[index],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
    
                // Text on the right half
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          titles[index], // Title from the list
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //const SizedBox(height: 5),
                        Text(subtitles[index]), // Subtitle from the list
                        const SizedBox(height: 5),
    
                        Container(height: 20,width: 100,
                        decoration: BoxDecoration( 
                          borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey), 
                        ),child: Center(child: Text(use[index],style: TextStyle(color: Colors.blue),)),)
                        ,
                        Text("Difficulty: ${difficulty[index]}"), // Difficulty from the list
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
      ),
    );
  }
}

class workoutheading extends StatelessWidget {
  const workoutheading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
              
             Text("Workout Routines"),
             Spacer(),
             Row(children: [ 
              Text("View all"),
              SizedBox(width: 5,),
              Icon(Icons.arrow_circle_right_rounded)
             ],)
    
            ],);
  }
}

class challange extends StatelessWidget {
  const challange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // decoration: BoxDecoration( 
      //   borderRadius: BorderRadius.circular(15),
          
      // ),
      child: ClipRRect( 
        //borderRadius: BorderRadius.circular(15),
    
        child: Image.asset('assets/images/assessment.png',
        fit: BoxFit.contain,
        width: double.infinity,
        height: 180,),
          
          
      ),
    );
  }
}

   



