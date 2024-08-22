import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class AddImagesToExistingDocument extends StatelessWidget {
  final String documentId;

  const AddImagesToExistingDocument({required this.documentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Images')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              // Here you would upload the image to Firebase Storage and get the URL
              String imageUrl = 'uploaded_image_url';

              // Add the image URL to the existing document
              FirebaseFirestore.instance.collection('items').doc(documentId).update({
                'images': FieldValue.arrayUnion([imageUrl]), // Assuming 'images' is an array field
              });
            }
          },
          child: Text('Upload Image'),
        ),
      ),
    );
  }
}
