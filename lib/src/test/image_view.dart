import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'image_controller.dart';

class ImageView extends StatefulWidget {
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  final ImageController _imageController = ImageController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        _imageController.uploadImage().then((imageUrl) {
          print('Image uploaded: $imageUrl');
        }).catchError((error) {
          // Handle errors
          print('Error uploading image: $error');
        });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
      ),
      child: Text(
        'Upload-Logo',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.black),
      ),
    );
  }
}
