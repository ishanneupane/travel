import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_nepal/cubit/app_cubit.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/widgets/custom_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  BlocProvider.of<AppCubits>(context).goHome();
                },
                child: const Icon(
                  Icons.home,
                  size: 50,
                ),
              ),
              Container(
                height: 500,
                child: ListView(
                  children: [
                    CustomText(text: detail.places.name),
                    CustomText(text: detail.places.body),
                    CustomText(text: detail.places.email),
                    CustomText(text: detail.places.id.toString()),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
