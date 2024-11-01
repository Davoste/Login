import 'package:flutter/material.dart';
import 'package:project/onboard/color.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D5715B"),
      body: Stack(
        children: [
          // Background Image at the Top
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: HexColor("#D5715B"),
              child: Image.asset(
                "assets/images/Group.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned widget at the bottom
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
                      "Quality",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
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
