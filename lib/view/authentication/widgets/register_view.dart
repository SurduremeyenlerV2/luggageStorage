import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luggage_storage/product/state/authCubit/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Full Name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff374151),
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              hintText: 'Enter your full name'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Email address',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff374151),
            ),
          ),
        ),
        TextField(
          controller: emailController,
          onChanged: (value) {},
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              hintText: 'mail@mail.com'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Password',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff374151),
            ),
          ),
        ),
        TextField(
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              hintText: 'Enter your password'),
        ),
        const SizedBox(
          height: 30,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Registration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(226, 8, 207, 181),
              fixedSize: const Size(256, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().signInWithGoogle();
            },
            child: const Text(
              'Sign up with Google',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff222222),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xffF4F4F4),
              fixedSize: const Size(256, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
