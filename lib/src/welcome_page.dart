import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/widgets/button.dart';
import 'package:visit_nepal/widgets/custom_container.dart';
import 'package:visit_nepal/widgets/custom_sizedBox.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["a.jpeg", "b.jpeg", "c.jpeg"];
  List<String> text = [
    "LET'S GO",
    "To the Mountains",
    "Na na na na na\n Mountains are calling...",
    "LET'S GO",
    "To visit Abroad",
    "Pa Pa Ra Pa Pa \n Wonders are waiting...",
    "LET'S GO",
    "To the Hills",
    "La La La La La\n Birds are singing...",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: AppBar(
      //   backgroundColor: Colors.black12,
      //   title: const Center(
      //     child: CustomText(
      //       text: "Travellers Pack",
      //       fontSize: 30,
      //     ),
      //   ),
      // ),
      body: PageView.builder(
        itemCount: images.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return CustomContainer(
            radius: 0,
            imageName: "assets/" + images[index],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(),
                CustomText(
                  text: text[3 * index],
                  textAlign: TextAlign.start,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: text[3 * index + 1],
                  fontSize: 22,
                ),
                CustomText(
                  text: "${text[3 * index + 2]} ",
                  textAlign: TextAlign.start,
                ),
                CustomButton(
                    text: "Go?",
                    fontSize: MediaQuery.of(_).size.height * .03,
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).login();
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
