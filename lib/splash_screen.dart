import 'package:flutter/material.dart';
import 'package:visit_nepal/services/firebase_services/splash_service.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashService _splashService = SplashService();
  @override
  void initState() {
    _splashService.isLoggedIn(context);
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "BY:Ishaan Neupane",
              fontSize: 25,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset('assets/ktm.png'),
    );
  }
}
