import 'package:flutter/material.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/onboard/color.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
            const Text(
              "Reset password?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              children: [
                const Text(
                  "Remember your password? ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to login
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
            const SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "New password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Confirm new password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            MaterialButton(
              onPressed: () {
                // Reset password logic
              },
              color: HexColor("#F8C569"),
              child: const Text(
                "Send code",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              minWidth: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
