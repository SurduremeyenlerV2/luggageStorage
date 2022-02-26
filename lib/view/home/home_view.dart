import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {
          context.router.replace(const MapView()); 
        },
        child: Text('Map'),
      ),
    );
  }
}
