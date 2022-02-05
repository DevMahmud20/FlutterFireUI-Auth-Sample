import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

final providerConfigs = [
  const EmailProviderConfiguration(),
  const PhoneProviderConfiguration(),
  const GoogleProviderConfiguration(
      clientId: "1:1025667794385:android:24829f212a6ab364c8ccf0"),
  const AppleProviderConfiguration(),
];

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(providerConfigs: providerConfigs);
        }
        return const ProfileScreen(providerConfigs: []);
      },
    );
  }
}
