import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/signup/presentation/signup_provider.dart';

class Signup extends ConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(signUpProivder);
    final notifier = ref.read( signUpProivder.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(state.supportState == SupportState.unknown)
                const CircularProgressIndicator()
              else if (state.supportState  == SupportState.supported)
                const Text('This device is supported')
              else
                const Text('This device is not supported'),
              const Divider(height: 100),
              Text('Can check biometrics: ${state.canCheckBiometrics}\n'),
              ElevatedButton(
                onPressed: notifier.checkBiometrics,
                child: const Text('Check biometrics'),
              ),
              const Divider(height: 100),
              Text('Available biometrics: ${state.availableBiometrics}\n'),
              ElevatedButton(
                onPressed: notifier.getAvailableBiometrics,
                child: const Text('Get available biometrics'),
              ),
              const Divider(height: 100),
              Text('Current State: ${state.authorized}\n'),
              if (state.isAuthenticating)
                ElevatedButton(
                  onPressed: notifier.cancelAuthentication,
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Cancel Authentication'),
                      Icon(Icons.cancel),
                    ],
                  ),
                )
              else
                Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: notifier.authenticate,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('Authenticate'),
                          Icon(Icons.perm_device_information),
                        ],
                      ),
                    ),
            ],
          ),
              ElevatedButton(
                onPressed: notifier.authenticateWithBiometrics,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      state.isAuthenticating
                          ? 'Cancel'
                          : 'Authenticate: biometrics only',
                    ),
                    const Icon(Icons.fingerprint),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
