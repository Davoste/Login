import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
//import 'package:twitter_login/twitter_login.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? _getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Begin interactive sign-in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      // User cancels
      if (gUser == null) return;

      // Obtain auth details
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in with credential
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // Navigate to the home page if sign-in is successful
      if (userCredential.user != null) {
        Navigator.of(context).pushReplacementNamed(
            '/home'); // Replace '/home' with your route name
      }
    } catch (e) {
      // Handle sign-in error
      print('Error during sign-in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign-in failed. Please try again.')),
      );
    }
  }
  //facebook

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredentials =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredentials);
  }

  // signInWithTwitter() async {
  //   // Create a TwitterLogin instance
  //   final twitterLogin = new TwitterLogin(
  //       apiKey: 'QUtWUjJ0SXJadUZvR1g2c3U3VTE6MTpjaQ',
  //       apiSecretKey: ' uTZD42U7lnI1xQwDO43fW8njyPqfgsmJxx0BE4FjfM0tKgpuc2',
  //       redirectURI: ' https://conn-d2504.firebaseapp.com/__/auth/handler');

  //   // Trigger the sign-in flow
  //   final authResult = await twitterLogin.login();

  //   // Create a credential from the access token
  //   final twitterAuthCredential = TwitterAuthProvider.credential(
  //     accessToken: authResult.authToken!,
  //     secret: authResult.authTokenSecret!,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance
  //       .signInWithCredential(twitterAuthCredential);
  // }
}
