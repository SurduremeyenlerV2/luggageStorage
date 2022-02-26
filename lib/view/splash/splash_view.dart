import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/core/service/localStorageService/local_storage_service.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final LocalStorageService _localStorageService = LocalStorageService();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
        initApp();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/seffaflogo.png',
        ),
      ),
    );
  }

  void initApp() async {
    await Firebase.initializeApp();
    var isLoggedIn = await _localStorageService.getBoolFromLocale(key: 'auth');
    if (isLoggedIn == null || isLoggedIn == false) {
      AutoRouter.of(context).replace(const AuthView());
    } else {
      AutoRouter.of(context).replace(const HomeView());
    }
  }
}
