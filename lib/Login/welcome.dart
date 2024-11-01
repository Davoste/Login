import 'package:flutter/material.dart';
import 'package:project/Login/forgot.dart';
import 'package:project/auth.dart';
import 'package:project/home.dart';
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
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showErrorDialog("Both email and password fields are required.", "Alert");
      return;
    }

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
      var responseData = json.decode(response.body);

      if (responseData["success"] == "true" ||
          responseData["success"] == true) {
        // Login successful, navigate to Home and pass the email
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(
              email: email, // Pass the actual email string
            ),
          ),
        );
      } else {
        // Login failed, show error message from API
        showErrorDialog(responseData["message"], "Failed");
      }
    } else {
      // HTTP error, show error message
      var errorData = json.decode(response.body);
      showErrorDialog('Login failed: ${errorData['message']}', "Failed");
    }
  }

  void showErrorDialog(String message, String heading) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(heading),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                GestureDetector(
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
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => login(),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Colors.amber, Colors.orangeAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      alignment: Alignment.center,
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
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => AuthService().signInWithFacebook(),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("assets/images/Group52@1x.png"),
                  ),
                ),
                GestureDetector(
                  onTap: () => AuthService().signInWithGoogle(),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset("../assets/images/google.jpeg"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
