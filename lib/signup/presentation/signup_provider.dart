
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpodinit/signup/model/SignupState.dart';

final signUpProivder = NotifierProvider<SignUpNotifier, SignupState>(SignUpNotifier.new);

enum SupportState { unknown, supported, unsupported }


class SignUpNotifier extends Notifier<SignupState>{

  final LocalAuthentication auth = LocalAuthentication();


  @override
  build() {
    _init();
    // TODO: implement build
    return   SignupState();
  }

  Future<void> _init() async{
    final isSupported = await auth.isDeviceSupported();
    state = state.copyWith(
      supportState : isSupported ? SupportState.supported : SupportState.unsupported,
    );
  }

  Future<void> checkBiometrics() async{
   try{
     final canCheck = await auth.canCheckBiometrics;
     state = state.copyWith(canCheckBiometrics : canCheck);
   } on PlatformException catch (e){
     state = state.copyWith(canCheckBiometrics: false);
   }
  }

  Future<void> getAvailableBiometrics() async {
   try{
     final availableBiometrics = await auth.getAvailableBiometrics();
     state =  state.copyWith(availableBiometrics: availableBiometrics);
   } on PlatformException catch(e){
     state = state.copyWith(availableBiometrics: []);
   }
  }

  Future<void> authenticate() async {
    state = state.copyWith(isAuthenticating: true, authorized: "Authenticating");
    try{
      final ok = await auth.authenticate(
          localizedReason: "let OS determine authentication method",
      );
      state = state.copyWith(
        isAuthenticating: false,
        authorized: ok ? 'Authorized' : 'Not Authorized',
      );
    } on LocalAuthentication catch (e){
      state = state.copyWith(
        isAuthenticating: false,
      //  authorized: 'Error - ${e.code.name}${e.message != null ?':${e.message}': ''}',
      );
    } on PlatformException catch (e){
      state = state.copyWith(
        isAuthenticating: false,
        authorized: 'Unexpected error = ${e.message}',
      );
    }

  }

  Future<void> authenticateWithBiometrics() async {
    state = state.copyWith(isAuthenticating: true, authorized: "Authenticating");

    try{
      final ok = await auth.authenticate(
        localizedReason: "let OS determine authentication method",
      );
      state = state.copyWith(
        isAuthenticating: false,
        authorized: ok ? 'Authorized' : 'Not Authorized',
      );
    } on LocalAuthentication catch (e){
      state = state.copyWith(
        isAuthenticating: false,
      //  authorized: 'Error - ${e.code.name}${e.message != null ?':${e.message}': ''}',
      );
    } on PlatformException catch (e){
      state = state.copyWith(
        isAuthenticating: false,
        authorized: 'Unexpected error = ${e.message}',
      );
    }
  }

  Future<void> cancelAuthentication() async {
    await auth.stopAuthentication();
    state = state.copyWith(isAuthenticating: false);
  }
}