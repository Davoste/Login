import 'package:flutter/material.dart';
import 'package:project/Login/forgot.dart';
import 'package:project/onboard/color.dart';
import 'package:project/signup/welcome_reg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;
    String deviceToken = "your_device_token";
    String socialId = "your_social_id";

    var data = {
      "email": email,
      "password": password,
      "role": "farmer",
      "device_token": deviceToken,
      "type": "email",
      "social_id": socialId,
    };

    var url = Uri.parse(
        'https://sowlab.com/assignment/user/login'); // Replace with your API endpoint
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Successful login
      var responseData = json.decode(response.body);
      print(responseData);
      // Navigate to the home screen or display a success message
    } else {
      // Failed login
      var errorData = json.decode(response.body);
      print('Login failed: ${errorData['message']}');
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
              "Welcome Back!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "New here? ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeReg()),
                    );
                  },
                  child: Text(
                    "Create Account",
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
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Email address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                border: OutlineInputBorder(),
                suffix: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Forgot()),
                    );
                  },
                  child: Text(
                    "Forgot?",
                    style: TextStyle(
                      color: HexColor("#F8C569"),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 200,
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
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "or login with",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "../assets/images/icons8-apple-logo1@1x.png",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "../assets/images/Group52@1x.png",
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
