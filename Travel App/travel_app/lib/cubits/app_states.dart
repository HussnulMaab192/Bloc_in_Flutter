import 'package:equatable/equatable.dart';
import 'package:travel_app/model/app_model.dart';

abstract class AppStates extends Equatable {}

class InitialState extends AppStates {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends AppStates {
  @override
  List<Object> get props => [];
}

class Loadingtate extends AppStates {
  @override
  List<Object> get props => [];
}

class Loadedstate extends AppStates {
  final List<AppModel> places;
  Loadedstate(this.places);
  @override
  List<Object> get props => [places];
}

class DetailsState extends AppStates {
  final AppModel place;

  DetailsState(this.place);
  @override
  List<Object> get props => [place];
}

class ErrorState extends AppStates {
  final String errorMessage;
  ErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
