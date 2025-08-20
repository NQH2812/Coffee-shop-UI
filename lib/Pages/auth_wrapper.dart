import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Pages/Signin_Screen.dart';
import 'loading_Screen.dart';
import '../Pages/mainScreen.dart'; // Import MainScreen của bạn

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        }
        
        if (snapshot.hasData && snapshot.data != null) {
          return MainScreen();
        }
        
        return SigninScreen();
      },
    );
  }
}