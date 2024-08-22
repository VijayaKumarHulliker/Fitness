import 'package:firebase_core/firebase_core.dart';
//import 'package:fitness/additional/itemlistscreen.dart';
//import 'package:fitness/design/app_theme.dart';
import 'package:fitness/firebase_options.dart';
//import 'package:fitness/upload/addui.dart';
//import 'package:fitness/upload/uploadtwo.dart';
import 'package:fitness/view/assessment_screen.dart';
//import 'package:fitness/viewmodel/fetch.dart';
import 'package:flutter/material.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Assessment(),
     //home: AddUI(),
     //home: ItemList(),
    //  home: AddImagesToExistingDocument(documentId: documentId),
    // home: ItemListScreen(),
    );
  }
}

