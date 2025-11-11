import 'package:local_auth/local_auth.dart';
import 'package:riverpodinit/signup/presentation/signup.dart';

import '../presentation/signup_provider.dart';

class SignupState{

  SupportState supportState;
  bool canCheckBiometrics;
  List<BiometricType> availableBiometrics;
  String authorized;
  bool isAuthenticating;


  SignupState({this.supportState = SupportState.unknown, this.canCheckBiometrics =false, this.authorized = "",
  this.isAuthenticating =false, this.availableBiometrics = const []});


  SignupState copyWith({
    SupportState? supportState,
    bool? canCheckBiometrics,
    List<BiometricType>? availableBiometrics,
    String? authorized,
    bool? isAuthenticating,
    }){
    return SignupState(
      supportState: supportState ?? this.supportState,
      canCheckBiometrics: canCheckBiometrics ?? this.canCheckBiometrics,
      availableBiometrics: availableBiometrics ?? this.availableBiometrics,
      authorized: authorized ?? this.authorized,
      isAuthenticating:  isAuthenticating ?? this.isAuthenticating

    );
  }
}