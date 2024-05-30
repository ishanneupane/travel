import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:visit_nepal/cubit/cubit_states.dart';
import 'package:visit_nepal/model/data_model.dart';
import 'package:visit_nepal/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(SplashState()) {
    emit(SplashState());
  }
  final ApiData data;
  late final places;
  newUser() async {
    emit(WelcomeState());
  }

  getData() async {
    try {
      emit(LoadingState());
      places = await data.getData();
      emit(LoadedState(places));
    } catch (e) {
      return const Text("App stopped working");
    }
  }

  login() {
    emit(LoginState());
  }

  register() {
    emit(RegistrationState());
  }

  detailPage(ModelPlaces data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
