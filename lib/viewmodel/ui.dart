
import 'package:fitness/view/my_appoinments.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ItemCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
    
        Container(
          
          child: Column(
            children: [
    
              Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
            
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        imageUrl,
                        width: 100,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: Icon(Icons.broken_image, color: Colors.grey),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ),
                  ),
            
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 8,),
                          Icon(Icons.play_circle,color: Colors.blue,
                          size: 24,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    
            
     // Viewallbutton(),
    
            ]
          ),
      
        ),
    
      
      // Row(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [ 
        
      //        Text("Challanges"),
      //        Spacer(),
      //        Row(children: [ 
      //         Text("View all"),
      //         SizedBox(width: 5,),
      //         Icon(Icons.arrow_circle_right_rounded)
      //        ],)
    
      //       ],),
    
      ],
    );
  }
}



