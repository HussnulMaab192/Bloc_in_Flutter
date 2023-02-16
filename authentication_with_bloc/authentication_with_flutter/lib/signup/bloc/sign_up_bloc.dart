import 'package:authentication_with_flutter/signup/bloc/events.dart';
import 'package:authentication_with_flutter/signup/bloc/states.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(InitialState()) {
    on<TextFieldChangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue!) == false) {
        emit(ErrorState("Please enter a valid Email "));
      } else if (event.passwordValue!.length < 8) {
        emit(ErrorState("Please enter a valid Password "));
      } else {
        emit(ValidState());
      }
    });
    on<SignUpPressEvent>((event, emit) {
      emit(LoadingState());
    });
  }
}
