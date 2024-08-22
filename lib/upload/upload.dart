import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

// Future<void> uploadImageAndData(File image, String title, String description) async {
//   try {
//     // Initialize Firebase Storage
//     FirebaseStorage storage = FirebaseStorage.instance;
    
//     // Create a unique filename based on the current time
//     String fileName = DateTime.now().toString() + '.jpg';
//     Reference ref = storage.ref().child('images/$fileName');
    
//     // Start the upload task
//     UploadTask uploadTask = ref.putFile(image);
    
//     // Wait for the upload to complete and get the download URL
//     TaskSnapshot snapshot = await uploadTask;
//     String downloadUrl = await snapshot.ref.getDownloadURL();
    
//     // Print the download URL (for debugging purposes)
//     print("Image URL: $downloadUrl");
    
//     // Save the image URL, title, and description to Firestore
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection('items').add({
//       'imageUrl': downloadUrl,
//       'title': title,
//       'description': description,
//     });
//   } catch (e) {
//     print("Error uploading image and saving data: $e");
//   }
// }


Future<void> uploadImageAndData(File image, String title, String description) async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    String fileName = DateTime.now().toString() + '.jpg';
    Reference ref = storage.ref().child('images/$fileName');
    UploadTask uploadTask = ref.putFile(image);

    uploadTask.snapshotEvents.listen((taskSnapshot) {
      print('Upload progress: ${taskSnapshot.bytesTransferred}/${taskSnapshot.totalBytes}');
    }, onError: (e) {
      print("Upload error: $e");
    });

    await uploadTask.whenComplete(() async {
      String downloadUrl = await ref.getDownloadURL();
      print("Image URL: $downloadUrl");

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('items').add({
        'imageUrl': downloadUrl,
        'title': title,
        'description': description,
      });
    });
  } catch (e) {
    print("Error uploading image and saving data: $e");
  }
}

