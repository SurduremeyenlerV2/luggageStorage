import 'package:flutter/material.dart';
import 'package:luggage_storage/core/service/authService/firebase_auth_service.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Google Signin'),
          onPressed: () {
            firebaseAuthService.googleSignIn();
          },
        ),
      ),
    );
  }
}
