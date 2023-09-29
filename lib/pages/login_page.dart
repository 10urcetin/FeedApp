import 'package:feedapp/pages/first_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'En & Joy',
        onLogin: _login,
        onSignup: _signup,
        onSubmitAnimationCompleted: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
          );
        },
        onRecoverPassword: _recoverPassword,
      ),
    );
  }

  Future<String?> _login(LoginData data) async {
  try {
    // Check if data.name and data.password are not null
    if (data.name != null && data.password != null) {
      await auth.signInWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );
      return null; // Return null for successful login
    } else {
      return 'Please provide a valid email and password.';
    }
  } on FirebaseAuthException catch (e) {
    return e.message; // Return an error message for unsuccessful login
  }
}

Future<String?> _signup(SignupData data) async {
  try {
    // Check if data.name and data.password are not null
    if (data.name != null && data.password != null) {
      await auth.createUserWithEmailAndPassword(
        email: data.name!,
        password: data.password!,
      );
      return null; // Return null for successful signup
    } else {
      return 'Please provide a valid email and password.';
    }
  } on FirebaseAuthException catch (e) {
    return e.message; // Return an error message for unsuccessful signup
  }
}

  Future<String?> _recoverPassword(String name) async {
    // Password recovery logic here (if needed)
    return null;
  }
}