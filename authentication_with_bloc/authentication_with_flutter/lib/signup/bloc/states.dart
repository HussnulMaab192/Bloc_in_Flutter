abstract class SignUpStates {}

class InitialState extends SignUpStates {}

class InvalidState extends SignUpStates {}

class ValidState extends SignUpStates {}

class ErrorState extends SignUpStates {
  String? message;
  ErrorState(this.message);
}

class LoadingState extends SignUpStates {}
