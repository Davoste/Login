import 'package:flutter/material.dart';
import 'package:project/onboard/onboarding.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/Vector@3x-5.png"),
            ),
            const SizedBox(height: 20),
            const Text(
              "You're all done!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can set up your inventory.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 100),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Onboarding(),
                  ),
                );
              },
              color: Colors.amber,
              child: const Text(
                "Got it!",
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
