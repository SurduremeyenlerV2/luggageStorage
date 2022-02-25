import 'package:flutter/material.dart';
import 'package:luggage_storage/view/authentication/auth_view.dart';

void main() {
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
