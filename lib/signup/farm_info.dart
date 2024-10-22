import 'package:flutter/material.dart';
import 'package:project/signup/verification.dart';

class FarmInfo extends StatefulWidget {
  TextEditingController name;
  TextEditingController email;
  TextEditingController phone;
  TextEditingController password;
  TextEditingController confPass;

  FarmInfo({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confPass,
  });

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  // controllers
  TextEditingController bizName = TextEditingController();
  TextEditingController nicName = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // GlobalKey to manage form state

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Assign the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Sign up 2 of 4",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Farm Info",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: bizName,
                      decoration: InputDecoration(
                        hintText: "Business name",
                        prefixIcon: const Icon(Icons.tag),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your business name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: nicName,
                      decoration: InputDecoration(
                        hintText: "Informal name",
                        prefixIcon: const Icon(Icons.emoji_emotions),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your informal name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: street,
                      decoration: InputDecoration(
                        hintText: "Street address",
                        prefixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your street address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: city,
                      decoration: InputDecoration(
                        hintText: "City",
                        prefixIcon: const Icon(Icons.location_city),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: state,
                            decoration: InputDecoration(
                              hintText: "State",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your state';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: zip,
                            decoration: InputDecoration(
                              hintText: "Enter zip code",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your zip code';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        height:
                            80), // Spacer to make room for the button at the bottom
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding for screen edges
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Back button action
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the next page if the form is valid
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Verification(
                              name: widget.name,
                              email: widget.email,
                              phone: widget.phone,
                              password: widget.password,
                              confPass: widget.confPass,
                              bizname: bizName,
                              biznic: nicName,
                              street: street,
                              city: city,
                              country: state,
                              zip: zip,
                            ),
                          ),
                        );
                      }
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
                      alignment:
                          Alignment.center, // Center text within the container
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
