// ignore_for_file: unused_local_variable, use_build_context_synchronously, unused_import
import 'package:flutter/material.dart';
import 'package:learningdart/constants/errors_const.dart';
import 'package:learningdart/constants/routes_const.dart';
import 'package:learningdart/services/auth/auth_exceptions.dart';
import 'package:learningdart/services/auth/auth_service.dart';
import 'package:learningdart/utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(title: Text("Login View")),
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
              final userCredential = await AuthService.firebase().logIn(
                email: email,
                password: password,
              );
              Navigator.of(context).pushNamedAndRemoveUntil(
                notesRoute,
                (route) => false,
              );
            } on InvalidCredentialsAuthException {
              await showErrorDialog(
                context,
                'Invalid Credentials',
              );
            } on InvalidEmailAuthException {
              await showErrorDialog(
                context,
                'Invalid Email',
              );
            } on GenericAuthException {
              await showErrorDialog(
                context,
                'Auth Error',
              );
            }
          },
          child: const Text("Login"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text('not registered? go here!'))
      ]),
    );
  }
}
