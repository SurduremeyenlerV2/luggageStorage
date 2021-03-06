import 'package:flutter/material.dart';
import 'package:luggage_storage/core/service/homeService/home_service.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = NavigationRoute();
  @override
  Widget build(BuildContext context) {
    HomeService homeService = HomeService();
    homeService.getCities();
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
