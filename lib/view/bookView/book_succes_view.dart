import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';

class BookSuccesView extends StatelessWidget {
  const BookSuccesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Icon(
                  Icons.beenhere_rounded,
                  size: 80,
                  color: Colors.green,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Booking Succesful',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            bookNowWidget(context),
          ],
        ),
      ),
    ));
  }

  Positioned bookNowWidget(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
              AutoRouter.of(context).replace(const HomeView());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.cyan),
            height: 60,
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'RETURN HOME',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      bottom: 0,
      left: 0,
      right: 0,
    );
  }
}
