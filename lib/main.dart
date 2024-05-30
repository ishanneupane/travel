import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_logics.dart';
import 'package:visit_nepal/services/data_services.dart';
import 'package:visit_nepal/services/firebase_services/firebase_options.dart';
import 'package:visit_nepal/src/authentication_pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: Typography.blackHelsinki,
          brightness: Brightness.light,
          primarySwatch: Colors.teal,
          primaryColor: Colors.red),
      darkTheme: ThemeData(
          brightness: Brightness.dark, textTheme: Typography.whiteCupertino),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: ApiData()),
        child: CubitLogics(),
      ),
    );
  }
}
