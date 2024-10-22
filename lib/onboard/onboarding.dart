import 'package:flutter/material.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/onboard/color.dart';
import 'package:project/signup/welcome_reg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: HexColor("#5EA25F"),
                child: Image.asset(
                  "../lib/Group44.png", // Corrected path
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          Padding(
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
                const Text(
                  "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.",
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeReg()),
                    );
                  },
                  child: Image.asset(
                    "../assets/images/Group45.png", // Corrected path
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Welcome()),
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
        ],
      ),
    );
  }
}
