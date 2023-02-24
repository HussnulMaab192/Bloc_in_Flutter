import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/app_states.dart';

import '../model/app_model.dart';
import '../services/app_services.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(Loadingtate());
      places = await data.getInfo();
      emit(Loadedstate(places));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void getDetails(AppModel data) async {
    try {
      emit(DetailsState(data));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  goHome() {
    emit(Loadedstate(places));
  }
}
