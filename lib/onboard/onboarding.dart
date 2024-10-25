import 'package:flutter/material.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/onboard/color.dart';
import 'package:project/signup/welcome_reg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#5EA25F"),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: HexColor("#5EA25F"),
                child: Image.asset(
                  "assets/images/Group44.png", // Corrected path
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Quality",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: const Text(
                      "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.",
                    ),
                  ),
                  SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeReg()),
                      );
                    },
                    child: Image.asset(
                      "assets/images/Group45.png",
                      height: 50,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Welcome()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
