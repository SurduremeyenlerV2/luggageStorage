
import 'package:flutter/material.dart';
import 'package:luggage_storage/view/authentication/widgets/login_register_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildAuthView(context);
  }

  Scaffold buildAuthView(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Color.fromARGB(78, 95, 95, 87),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                'assets/seffaflogo.png',
                height: 225.0,
              ),
            ),
            const Text(
              'Welcome !',
              style: TextStyle(
                color: Color(0xff1F2937),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Before using Luggage Locker",
              style: TextStyle(
                color: Color(0xff4B5563),
                fontSize: 14,
              ),
            ),
            const Text(
              'Please register first',
              style: TextStyle(
                color: Color(0xff4B5563),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                formRegistration(context);
              },
              child: const Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 8, 207, 181),
                fixedSize: const Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                formRegistration(context);
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 8, 207, 181),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(69, 8, 207, 181),
                fixedSize: const Size(256, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'By logging in or registering, you have agreed to ',
                  style: TextStyle(
                    color: Color(0xff242323),
                  ),
                ),
                TextSpan(
                  text: 'Terms and Conditions ',
                  style: TextStyle(
                    color: Color.fromARGB(223, 8, 207, 181),
                  ),
                ),
                TextSpan(
                  text: 'And ',
                  style: TextStyle(
                    color: Color(0xff242323),
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(
                    color: Color.fromARGB(221, 8, 207, 181),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
