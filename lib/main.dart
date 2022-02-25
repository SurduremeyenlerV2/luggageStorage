import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/view/authentication/auth_view.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthView(),
    );
  }
}
