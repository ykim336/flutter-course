// ignore_for_file: unused_import, use_build_context_synchronously, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/constants/errors_const.dart';
import 'package:learningdart/constants/routes_const.dart';
import 'package:learningdart/utilities/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register View")),
      body: Column(children: [
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(hintText: "Email:"),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: _password,
          decoration: InputDecoration(hintText: "Password:"),
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
              Navigator.of(context).pushNamed(verifyEmailRoute);
            } on FirebaseAuthException catch (e) {
              if (e.code == emailAlreadyInUseError) {
                await showErrorDialog(
                  context,
                  'Email Already in Use',
                );
              } else if (e.code == invalidEmailError) {
                await showErrorDialog(
                  context,
                  'Invalid Email',
                );
              } else if (e.code == weakPasswordError) {
                await showErrorDialog(
                  context,
                  'Weak Password',
                );
              } else {
                await showErrorDialog(
                  context,
                  e.code,
                );
              }
            }
          },
          child: const Text("Register"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: Text("Back to login"))
      ]),
    );
  }
}
