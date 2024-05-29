import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visit_nepal/widgets/button.dart';
import 'package:visit_nepal/widgets/custom_sizedBox.dart';
import 'package:visit_nepal/widgets/custom_text.dart';
import 'package:visit_nepal/widgets/toast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(
              CupertinoIcons.forward,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.blue.shade900,
        title: const Center(
          child: CustomText(
            text: "   Registration",
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey.shade200, Colors.blue.shade400])),
        child: ListView(
          children: [
            CustomSizedBox(),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      validator: (value) {
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value!)) {
                          return 'Name must contain only letters';
                        }
                        if (value.length < 2) {
                          return 'Name must be at least 2 characters long';
                        } else
                          return null;
                      },
                      decoration: const InputDecoration(
                          labelText: "Name",
                          icon: Icon(Icons.person),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: "Ramesh"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!RegExp(r"^\w+[@]+[a-zA-Z]+[.]+[a-z]{2,}$")
                            .hasMatch(value!)) {
                          return "Email address not valid";
                        } else
                          return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          labelText: "Email",
                          hintText: "123@gmail.com",
                          icon: Icon(Icons.email)),
                    ),
                    CustomSizedBox(value: .02),
                    TextFormField(
                      readOnly: true,
                      controller: ageController,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          icon: Icon(Icons.date_range),
                          labelText: "Date of birth"),
                      onTap: () async {
                        final DateTime? age = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now());
                        if (age != null)
                          setState(() {
                            ageController.text =
                                age.toIso8601String().substring(0, 10);
                          });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            icon: Icon(Icons.lock),
                            labelText: "Password"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (passwordController.text.length < 5) {
                            return "Too short";
                          } else {
                            return null;
                          }
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: "Register",
                      color: Colors.green,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            await auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            CustomToast().show('Registration successful',
                                color: Colors.green);
                            Navigator.of(context).pop();
                          } catch (error) {
                            String errorMessage = error.toString();
                            List<String> parts = errorMessage.split("]");
                            String endPart = parts[1];
                            CustomToast().show(endPart);
                          }
                          ;
                        }
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
