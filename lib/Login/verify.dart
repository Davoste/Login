import 'package:flutter/material.dart';
import 'package:project/Login/reset.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/onboard/color.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Verify OTP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                Text(
                  "Remember your password ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle login tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Welcome()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: HexColor("#F8C569"),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOtpTextField(),
                _buildOtpTextField(),
                _buildOtpTextField(),
                _buildOtpTextField(),
                _buildOtpTextField(),
                _buildOtpTextField(),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWidget()),
                );
              },
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
                alignment: Alignment.center, // Center text within the container
                child: const Text(
                  "SUBMIT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                // Handle resend code
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWidget()),
                );
              },
              child: Text(
                "Resend code",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A method to build individual OTP TextFields
  Widget _buildOtpTextField() {
    return SizedBox(
      width: 40, // Adjust the width based on your design
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1, // To allow only 1 digit
      ),
    );
  }
}
