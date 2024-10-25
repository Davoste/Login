import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:twitter_login/twitter_login.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  signInWithGoogle() async {
    //begin interactive sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //iser cancels
    if (gUser == null) return;

    //obtain auth details
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
