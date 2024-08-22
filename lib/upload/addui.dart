import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fitness/upload/upload.dart';  // Import the upload logic

class AddUI extends StatefulWidget {
  @override
  _AddUIState createState() => _AddUIState();
}

class _AddUIState extends State<AddUI> {
  File? _image;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _upload() async {
    if (_image != null && _titleController.text.isNotEmpty && _descriptionController.text.isNotEmpty) {
      await uploadImageAndData(
        _image!,
        _titleController.text,
        _descriptionController.text,
      );
      // Show success message or navigate away    
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload successful')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please complete all fields')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: _upload,
              child: Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
