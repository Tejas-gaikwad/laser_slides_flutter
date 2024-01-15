import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'constants_colors.dart';

class AddLaserDetailsScreen extends StatefulWidget {
  const AddLaserDetailsScreen({super.key});

  @override
  State<AddLaserDetailsScreen> createState() => _AddLaserDetailsScreenState();
}

class _AddLaserDetailsScreenState extends State<AddLaserDetailsScreen> {
  late TextEditingController _laserNameController;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        // You can customize other options like maxWidth, maxHeight, etc.
      );

      if (pickedFile != null) {
        // Handle the picked image file
        print("Image path: ${pickedFile.path}");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickVideo(
        source: source,
        // You can customize other options like maxDuration, etc.
      );

      if (pickedFile != null) {
        // Handle the picked video file
        print("Video path: ${pickedFile.path}");
      }
    } catch (e) {
      print("Error picking video: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _laserNameController = TextEditingController();
  }

  @override
  void dispose() {
    _laserNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyishColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Add Laser Slide',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                'Enter Laser Slide Name:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              textFieldWidget(
                hintText: 'Add Laser name',
                textEditingController: _laserNameController,
              ),
              SizedBox(height: 15),
              Text(
                'Add Image or Video of laser slide:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(
                        Icons.video_call_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFieldWidget({
    required String hintText,
    required TextEditingController textEditingController,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          filled: true,
          fillColor: greyishColor2, // Set grey color for the background
          contentPadding: const EdgeInsets.all(16.0),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0), // Set circular border
          ),
        ),
      ),
    );
  }
}
