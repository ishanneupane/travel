import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/src/authentication_pages/registration_page.dart';
import 'package:visit_nepal/widgets/button.dart';
import 'package:visit_nepal/widgets/custom_sizedBox.dart';
import 'package:visit_nepal/widgets/custom_text.dart';
import 'package:visit_nepal/widgets/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            const CustomSizedBox(),
            const CustomText(
              text: "Login",
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                if (!RegExp(r"^\w+@+[a-zA-Z]+[.]+[a-zA-Z]{2,3}$")
                    .hasMatch(value)) {
                  return "Email address is not correct";
                }
                return null;
              },
              controller: emailController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: Icon(Icons.email),
                labelText: "Email",
                hintText: "abc@gmail.com",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                } else if (value.length < 6) {
                  return "Password must at least have 6 characters";
                }
                return null;
              },
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                icon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "*******",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                  color: Colors.green,
                  width: .45,
                  text: "Log in",
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        BlocProvider.of<AppCubits>(context).getData();
                        CustomToast().show(
                          'Login successful',
                          color: Colors.green,
                        );
                      } catch (error) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: CustomText(
                                text: 'Invalid Email or Password',
                              ),
                            );
                          },
                        );
                      }
                    }
                  }),
            ),
            Center(
              child: CustomButton(
                color: Colors.blueAccent,
                width: .5,
                text: "Sign Up?",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
