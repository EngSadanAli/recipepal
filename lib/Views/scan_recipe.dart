import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScanRecipeScreen extends StatefulWidget {
  const ScanRecipeScreen({Key? key}) : super(key: key);

  @override
  _ScanRecipeScreenState createState() => _ScanRecipeScreenState();
}

class _ScanRecipeScreenState extends State<ScanRecipeScreen> {
  File? recipeImage;
  String recipeOutput = '';
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _captureImageFromCamera() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        recipeImage = File(image.path);
        recipeOutput = ''; // Clear previous recipe output
      });

      // Perform image processing and recipe detection
      // Replace this with your own logic to process the captured image and detect the recipe

      // Example recipe output
      setState(() {
        recipeOutput = 'How to Cook Rice:\n\n1. Rinse the rice under cold water.\n2. Bring water to a boil in a pot.\n3. Add the rice to the boiling water.\n4. Cover the pot and reduce heat to low.\n5. Cook for 15-20 minutes until the water is absorbed.\n6. Fluff the rice with a fork and serve.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: const Text('Scan Recipe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              _captureImageFromCamera();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (recipeImage != null)
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    recipeImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (recipeOutput.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recipe',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Handle favorite button tap
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      recipeOutput,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            if (recipeImage == null && recipeOutput.isEmpty)
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      size: 48,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Capture an image of a recipe using the camera icon in the app bar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
