class SignUpEvents {}

class TextFieldChangeEvent extends SignUpEvents {
  String? emailValue;
  String? passwordValue;
  TextFieldChangeEvent(this.emailValue, this.passwordValue);
}

class SignUpPressEvent extends SignUpEvents {
  String? email;
  String? password;
  SignUpPressEvent(this.email, this.password);
}
