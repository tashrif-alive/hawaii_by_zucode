import 'package:flutter/material.dart';

import 'image_controller.dart';

class ImageView extends StatefulWidget {
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final ImageController _imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _imageController.uploadImage().then((imageUrl) {
              // Handle the uploaded image URL as needed (e.g., save to Firestore)
              print('Image uploaded: $imageUrl');
            }).catchError((error) {
              // Handle errors
              print('Error uploading image: $error');
            });
          },
          child: Text('Upload Image'),
        ),
      ),
    );
  }
}
