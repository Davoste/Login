import 'package:flutter/material.dart';
import 'package:project/onboard/color.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Container(
              color: HexColor("#D5715B"),
              child: Image.asset(
                "../assets/images/Group.png",
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
          ),
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
                "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers. ",
              ),
              //Spacer(),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                "../assets/images/Group45.png",
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
