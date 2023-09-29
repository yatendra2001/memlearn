import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memlearn/src/auth/service/auth_repo.dart';
import 'package:memlearn/src/home/view/home_page.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth-page';
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLogin = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final supabase = Supabase.instance.client;
  final authRepo = AuthRepo();

  bool _redirecting = false;
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed(HomePage.routeName);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Memlearn',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const Text(
                  'A new way to learn',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                NeoPopButton(
                  color: Colors.white70,
                  onTapUp: () async {
                    HapticFeedback.vibrate();
                    if (_isLogin) {
                      await authRepo.signInWithEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                      authRepo.createAndUploadKeypair(
                          email: _emailController.text);
                    } else {
                      await authRepo.signUpWithEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }
                  },
                  onTapDown: () => HapticFeedback.vibrate(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_isLogin ? ' Sign in' : ' Sign up'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  child: Text(
                      _isLogin ? 'Switch to Sign up' : 'Switch to Sign in'),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
