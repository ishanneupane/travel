import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/src/detail_page.dart';
import 'package:visit_nepal/src/navigation_pages/nav_page.dart';
import 'package:visit_nepal/src/starting_page.dart';

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
            return StartingPage();
          }
          if (state is DetailState) {
            return DetailPage();
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return NavigationPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
