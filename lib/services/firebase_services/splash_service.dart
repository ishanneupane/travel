import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';

class SplashService {
  void isLoggedIn(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 5), () {
        BlocProvider.of<AppCubits>(context).getData();
      });
    } else {
      Timer(const Duration(seconds: 4), () {
        BlocProvider.of<AppCubits>(context).newUser();
      });
    }
  }
}
