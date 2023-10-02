import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'dark_theme_provider.dart';
import 'themes.dart';
import 'fallback_screen.dart'; 

class CreatePromotionScreen extends StatefulWidget {
  const CreatePromotionScreen({super.key});

  @override
  CreatePromotionScreenState createState() => CreatePromotionScreenState();
}

class CreatePromotionScreenState extends State<CreatePromotionScreen> {
  TextEditingController promotionTitleController = TextEditingController();
  TextEditingController campaignDescriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController targetDemographicController = TextEditingController();
  TextEditingController discountPercentageController = TextEditingController();
  TextEditingController productUrlController = TextEditingController();
  TextEditingController termsAndConditionsController = TextEditingController();

  final List<File?> _pickedImages = List.generate(5, (index) => null);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                themeProvider.isDarkMode
                    ? AppThemes.darkBackgroundImage
                    : AppThemes.lightBackgroundImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 60.0),
              const Text(
                'Launch your next campaign',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15.0),
              _buildTextField(promotionTitleController, 'Enter promotion title'),
              const SizedBox(height: 15.0),
              _buildTextField(campaignDescriptionController, 'Describe your campaign', height: 100.0),
              const SizedBox(height: 15.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upload up to 4 images',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          _showImageOptions(index);
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            image: _pickedImages[index] != null
                                ? DecorationImage(image: FileImage(_pickedImages[index]!), fit: BoxFit.cover)
                                : null,
                          ),
                          child: _pickedImages[index] == null
                              ? const Icon(Icons.add_a_photo, color: Colors.grey) // Grey color for icon
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildTextFieldWithLabel(startDateController, 'Enter start date'),
              const SizedBox(height: 15.0),
              _buildTextFieldWithLabel(endDateController, 'Enter end date'),
              const SizedBox(height: 15.0),
              _buildTextField(targetDemographicController, 'Enter target demographic'),
              const SizedBox(height: 15.0),
              _buildTextField(discountPercentageController, 'Enter discount percentage'),
              const SizedBox(height: 15.0),
              _buildTextField(productUrlController, 'Enter product/service URL'),
              const SizedBox(height: 15.0),
              _buildTextField(termsAndConditionsController, 'Enter promotion terms and conditions', height: 100.0),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey,
                  backgroundColor: Colors.white, 
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Navigate to the FallbackScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FallbackScreen(),
                    ),
                  );
                },
                child: const Text('Publish'),
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the FallbackScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FallbackScreen(),
                          ),
                        );
                      },
                      child: const Text('Go back', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the FallbackScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FallbackScreen(),
                          ),
                        );
                      },
                      child: const Text('Save as draft', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    themeProvider.toggleDarkMode();
                  });
                },
                child: Text(
                  themeProvider.isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showImageOptions(int index) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return Container(
          color: Theme.of(context).colorScheme.primary,
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera, color: Colors.grey),
                title: const Text('Take Image', style: TextStyle(color: Colors.grey)),
                onTap: () async {
                  Navigator.pop(builderContext); 
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _pickedImages[index] = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.image, color: Colors.grey),
                title: const Text('Upload from Gallery', style: TextStyle(color: Colors.grey)),
                onTap: () async {
                  Navigator.pop(builderContext); 
                  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _pickedImages[index] = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextFieldWithLabel(TextEditingController controller, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color.fromARGB(255, 120, 120, 120))),
        const SizedBox(height: 8.0),
        _buildTextField(controller, ''),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {double height = 25.0}) {
    return TextField(
      controller: controller,
      maxLines: (height / 20).round(),
      style: const TextStyle(color: Color.fromARGB(255, 120, 120, 120)),
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 120, 120, 120)),
      ),
    );
  }
}



