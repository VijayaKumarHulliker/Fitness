
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fitness/viewmodel/ui.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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

          List<DocumentSnapshot> docs = snapshot.data!.docs;
          List<DocumentSnapshot> itemsToShow = docs.skip(1).toList();

          return ListView(
            children: itemsToShow.map((doc) {
              return ItemCard(
                imageUrl: doc['imageUrl'],
                title: doc['title'],
                description: doc['description'],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

