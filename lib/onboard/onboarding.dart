import 'package:flutter/material.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/log.dart';
import 'package:project/onboard/color.dart';
import 'package:project/signup/welcome_reg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#5EA25F"),
      body: Stack(
        children: [
          // Background Image at the Top
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: HexColor("#5EA25F"),
              child: Image.asset(
                "assets/images/Group44.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned widget at the bottom
          Positioned(
            bottom: 0, // Positions the widget at the bottom
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content
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
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 30),
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
                              builder: (context) => const logged()),
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
