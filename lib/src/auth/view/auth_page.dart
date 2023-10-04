import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memlearn/src/auth/service/auth_repo.dart';
import 'package:memlearn/src/home/view/home_page.dart';
import 'package:memlearn/src/utils/theme_constants.dart';
import 'package:memlearn/src/widgets/pop_button.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:sizer/sizer.dart';
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
    _authStateSubscription = supabase.auth.onAuthStateChange.listen(
      (data) {
        if (_redirecting) return;
        final session = data.session;
        if (session != null) {
          _redirecting = true;
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        }
      },
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _isLogin ? ' Log in' : ' Sign up',
              style: TextStyle(
                  color: AppColorTheme.kColorWhiteText,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4.h),
            TextField(
              controller: _emailController,
              cursorColor: AppColorTheme.kColorWhiteText,
              style: TextStyle(
                  color: AppColorTheme.kColorWhiteText,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColorTheme.kColorNotWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColorTheme.kColorNotWhite,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            TextField(
              controller: _passwordController,
              obscureText: true,
              cursorColor: AppColorTheme.kColorWhiteText,
              style: TextStyle(
                  color: AppColorTheme.kColorWhiteText,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColorTheme.kColorNotWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColorTheme.kColorNotWhite),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PopButton(
              size: 10.sp,
              color: AppColorTheme.kColorNotWhite,
              onPressed: () async {
                HapticFeedback.vibrate();
                if (_isLogin) {
                  await authRepo.signInWithEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text);
                  authRepo.createAndUploadKeypair(email: _emailController.text);
                } else {
                  await authRepo.signUpWithEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 33.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "continue →",
                      style: TextStyle(
                          color: AppColorTheme.kColorNotBlack,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              child: Text(
                _isLogin ? 'Switch to Sign up' : 'Switch to Sign in',
                style: TextStyle(
                    color: AppColorTheme.kColorWhiteText,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                setState(
                  () {
                    _isLogin = !_isLogin;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
