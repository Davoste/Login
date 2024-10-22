import 'package:flutter/material.dart';
import 'package:project/Login/verify.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/onboard/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController phoneController = TextEditingController();

  Future<void> reset() async {
    String phone = phoneController.text;

    var data = {
      "mobile": phone,
    };

    var url = Uri.parse(
        'https://sowlab.com/assignment/user/forgot-password'); // Replace with your API endpoint
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Verify()),
      );
      // Successful login
      var responseData = json.decode(response.body);
      print(responseData);
      // Navigate to the home screen or display a success message
    } else {
      // Failed login
      var errorData = json.decode(response.body);
      print('Failed: ${errorData['message']}');
      // Display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FarmerEats",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot password?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Remember your password? ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Welcome()),
                    );

                    // Navigate to login
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#F8C569"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
                hintText: "+1984512598",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                reset();
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25), // Rounded corners
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
                    "Send Code",
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
      ),
    );
  }
}
