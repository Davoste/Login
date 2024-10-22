import 'package:flutter/material.dart';
import 'package:project/onboard/color.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Container(
              color: HexColor("#F8C569"),
              child: Image.asset(
                "../assets/images/Group46.png",
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
                "Local",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time.  ",
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
