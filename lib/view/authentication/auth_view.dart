
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luggage_storage/core/service/authService/firebase_auth_service.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/product/state/authCubit/auth_cubit.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthService firebaseAuthService = FirebaseAuthService();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            var snackBar = SnackBar(
              content: Text(state.error),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is AuthSucces) {
            const snackBar = SnackBar(
              content: Text('Successful'),
            );
            context.router.replace(const HomeView()); 
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is AuthInitial || state is AuthFailed) {
            return BuildAuth(firebaseAuthService: firebaseAuthService);
          } else if (state is AuthLoading) {
            return CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}

class BuildAuth extends StatelessWidget {
  const BuildAuth({
    Key? key,
    required this.firebaseAuthService,
  }) : super(key: key);

  final FirebaseAuthService firebaseAuthService;

  @override
  Widget build(BuildContext context) {
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
