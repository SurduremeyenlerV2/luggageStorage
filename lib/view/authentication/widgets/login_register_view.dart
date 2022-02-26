import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luggage_storage/product/navigation/route.gr.dart';
import 'package:luggage_storage/product/state/authCubit/auth_cubit.dart';
import 'package:luggage_storage/view/authentication/widgets/login_view.dart';
import 'package:luggage_storage/view/authentication/widgets/register_view.dart';

void formRegistration(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    // isDismissible: false,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    builder: (BuildContext context) {
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
              return buildLoginRegisterTabs();
            } else if (state is AuthLoading) {
              return SizedBox(height: 550, child: Center(child: CircularProgressIndicator()));
            }
            return Container();
          },
        ),
      );
    },
  );
}

SizedBox buildLoginRegisterTabs() {
  return SizedBox(
    height: 550,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Container(
            height: 5,
            width: 50,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          const SizedBox(
            height: 40,
          ),
          DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Color.fromARGB(69, 8, 207, 181),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    labelColor: Color.fromARGB(255, 8, 207, 181),
                    unselectedLabelColor: Color(0xff89909E),
                    tabs: <Widget>[
                      Tab(
                        text: 'Create Account',
                      ),
                      Tab(
                        text: 'Login',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: TabBarView(children: [
                      RegisterView(),
                      LoginView(),
                    ]),
                  )
                ],
              )),
        ],
      ),
    ),
  );
}
