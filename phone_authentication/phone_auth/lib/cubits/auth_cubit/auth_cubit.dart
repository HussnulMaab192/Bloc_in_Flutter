import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitialState()) {
    User? user = auth.currentUser;
    if (user != null) {
      emit(AuthLoggedInState(user));
    } else {
      emit(AuthLoggedOutState());
    }
  }

  String? _verificationId;
  void sendOTP(String phNo) async {
    emit(AuthLoadingState());
    await auth.verifyPhoneNumber(
      phoneNumber: phNo,
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message));
      },
      codeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        emit(AuthCodeSentState());
      },
      codeAutoRetrievalTimeout: (verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  void verifyOTP(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signInWithPhone(credential);
  }

  void signInWithPhone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthErrorState(e.toString()));
    }
  }

  void logOut() async {
    await auth.signOut();
    emit(AuthLoggedOutState());
  }
}
