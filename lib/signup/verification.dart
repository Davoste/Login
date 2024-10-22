import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project/signup/business_hours.dart';

class Verification extends StatefulWidget {
  TextEditingController name;
  TextEditingController email;
  TextEditingController phone;
  TextEditingController password;
  TextEditingController confPass;
  TextEditingController bizname;
  TextEditingController biznic;
  TextEditingController street;
  TextEditingController city;
  TextEditingController country;
  TextEditingController zip;

  Verification({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confPass,
    required this.bizname,
    required this.biznic,
    required this.street,
    required this.city,
    required this.country,
    required this.zip,
  });

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  File? _pickedFile;

  // Function to pick a file (like a PDF)
  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'], // Allowing specific file types
    );
    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FarmerEats",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Sign up 3 of 4",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Verification",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Attach proof of Department of Agriculture registration i.e. Florida Fresh, USDA Approved, USDA Organic",
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Attach proof of registration",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickFile, // Handle file picking
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 25, // Adjust size of the circle
                        ),
                        const Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 20, // Adjust icon size to fit inside circle
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_pickedFile != null) // Display the selected file path
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Selected file: ${_pickedFile!.path.split('/').last}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back
                    },
                  ),
                  const SizedBox(width: 16), // Space between button and icon
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BusinessHours(
                              name: widget.name,
                              email: widget.email,
                              phone: widget.phone,
                              password: widget.password,
                              confPass: widget.confPass,
                              bizname: widget.bizname,
                              biznic: widget.biznic,
                              street: widget.street,
                              city: widget.city,
                              country: widget.country,
                              zip: widget.zip,
                              proof: 'image.png',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.circular(25), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3), // Shadow position
                            ),
                          ],
                          gradient: const LinearGradient(
                            colors: [Colors.amber, Colors.orangeAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        alignment: Alignment
                            .center, // Center text within the container
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
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
}
