import 'package:flutter/material.dart';
import 'package:project/onboard/color.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#F8C569"),
      body: Stack(
        children: [
          // Background Image at the Top
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: HexColor("#F8C569"),
              child: Image.asset(
                "assets/images/Group46.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned container at the bottom
          Positioned(
            bottom: 0,
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
                      "Local",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Image.asset(
                      "assets/images/Group45.png",
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
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
