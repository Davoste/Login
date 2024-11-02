import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Login/welcome.dart';
import 'package:project/home.dart';

class logged extends StatelessWidget {
  const logged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //is user logged in
            if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser!;

              return Home(email: user.email!);
            }
            //is user not logged in
            else {
              return Welcome();
            }
          }),
    );
  }
}
