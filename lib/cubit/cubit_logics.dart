import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/splash_screen.dart';
import 'package:visit_nepal/src/authentication_pages/login_page.dart';
import 'package:visit_nepal/src/authentication_pages/registration_page.dart';
import 'package:visit_nepal/src/detail_page.dart';
import 'package:visit_nepal/src/navigation_pages/nav_page.dart';
import 'package:visit_nepal/src/welcome_page.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({super.key});

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is DetailState) {
            return const DetailPage();
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginState) {
            return const LoginPage();
          } else if (state is SplashState) {
            return const SplashScreen();
          } else if (state is RegistrationState) {
            return const RegistrationPage();
          } else if (state is LoadedState) {
            return const NavigationPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
