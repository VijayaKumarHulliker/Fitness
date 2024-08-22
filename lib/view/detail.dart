

import 'package:flutter/material.dart';
//ignore: prefer_const_constructors

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Stack(
        children: [
          // First container with text, icon, and image from assets
          Container(
            height: height * 0.45,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 179, 252, 224),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  // Column with text and icon
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Health Risk Assessment',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 44, 81),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.alarm_outlined, size: 18),
                              SizedBox(width: 4),
                              Text(
                                "4 min",
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image on the other side from assets
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/healthriskassessm.png', // Replace with your image path in assets
                        fit: BoxFit.contain,
                        width: width * 0.4,
                        height: height * 0.3,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: width * 0.4,
                            height: height * 0.3,
                            color: Colors.grey[200],
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Second container with white background and scrollable content
          Container(
            height: height * 0.6,
            margin: EdgeInsets.only(top: height * 0.4),
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10, width: double.infinity),
                  Text(
                    "What do you get?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 44, 81),
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset("assets/images/healthriskdetailsheading.png"),
                  SizedBox(height: 20),
                  Text("How we do it ?",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 44, 81),
                    ),),
                  SizedBox(height: 20,),
//how we do it container
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Color.fromARGB(255, 243, 248, 243),
                    borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                          SizedBox(height: 20,),
                        Image.asset("assets/images/healthriskdetailsimage.png"),
                        SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration( 
                                
                              color: const Color.fromARGB(255, 173, 239, 175),borderRadius: BorderRadius.circular(12),
                              ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: 
                            [ Icon(Icons.report_problem),
                              SizedBox(width: 10,),
                              Text("We do not store your personal data",style: TextStyle(fontSize: 12,color: Colors.grey),),
                            ]),
                          ),
                        ),
                        SizedBox(height: 10,),

                        Text("1.Ensure that you are in a well-space             ",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),

                        Text("2.Allow camera access and place your device against a stable object or wall",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),

                        Text("3.Avoding wearing baggy clothes                  ",style:  TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),

                        Text("4.Making sure you exercise as per the instruction provided by the trainer",style:  TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),

                        Text("5.Watch the short preview before each exercise     ",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),


                        
                        






                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Benifits",style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 44, 81),
                    )),
                  SizedBox(height: 20,),

                  Container(
                  //.height: ,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration( 
                    color: Color.fromARGB(255, 243, 248, 243),
                    borderRadius: BorderRadius.circular(15)

                  ),child: Column(children: [ 
                    SizedBox(height: 10,),
                    Text("Holistic insight into Physical Health Across Multiple Key Areas",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),
                    SizedBox(height: 10,),
                    Text("Enables Early Interventions ,Improving  Preventive Care and Health Outcomes",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),
                    SizedBox(height: 10,),
                    Text("Tailored Lifestyle and Health Recommendations Based on Deatailed Assessment Result",style: TextStyle(fontSize: 12,color: Color.fromARGB(255, 62, 60, 60)),),
                    SizedBox(height: 10,)
                    
                  ]),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container( 
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                          Icon(Icons.play_arrow,color: Colors.white,),
                          SizedBox(width: 10,),
                          Text("Start Assessment",style: TextStyle(color: Colors.white,fontSize: 20),)


                      ],),
                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
