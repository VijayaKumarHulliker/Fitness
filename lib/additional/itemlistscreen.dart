//import 'package:fitness/upload/uploadtwo.dart';
import 'package:fitness/additional/addiamgestoexistingdocument.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'add_images_to_existing_document.dart'; // Your image upload screen

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              String documentId = doc.id;

              return ListTile(
                title: Text(doc['title']),
                onTap: () {
                  // Navigate to the AddImagesToExistingDocument screen with the documentId
                  Navigator.push(
                    context,
                    MaterialPageRoute(

                      builder: (context) => AddImagesToExistingDocument(documentId: documentId),
                      
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
