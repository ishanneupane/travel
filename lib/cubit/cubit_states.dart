import 'package:equatable/equatable.dart';
import 'package:visit_nepal/model/data_model.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<ModelPlaces> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  DetailState(this.places);
  final ModelPlaces places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}
