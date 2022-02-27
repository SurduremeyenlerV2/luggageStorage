import 'package:flutter/material.dart';

class BookNow extends StatelessWidget {
  final void function;
  const BookNow({Key? key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            function;
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 104, 180, 241)),
            height: 60,
            child: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'BOOK NOW',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
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
