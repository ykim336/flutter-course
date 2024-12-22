// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/constants/routes_const.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("We've sent a email verification. Please open."),
            const Text('If you have not recieved email, press button below.'),
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                user?.sendEmailVerification();
              },
              child: const Text('Send verification'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ),
    );
  }
}
