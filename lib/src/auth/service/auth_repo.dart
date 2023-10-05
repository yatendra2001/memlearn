import 'package:flutter/material.dart';
import 'package:memcode/src/auth/service/base_auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo extends BaseAuthRepo {
  final supabaseClient = Supabase.instance.client;

  @override
  Future<void> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      await supabaseClient.auth.signUp(email: email, password: password);
    } catch (error) {
      debugPrint("Signup with email password error: $error");
    }
  }

  @override
  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      await supabaseClient.auth
          .signInWithPassword(password: password, email: email);
    } catch (error) {
      debugPrint("Signin with email password error: $error");
    }
  }

  @override
  Future<void> createAndUploadKeypair({required String email}) async {
    try {
      await supabaseClient.from('user').insert({
        'user_id': supabaseClient.auth.currentUser!.id,
        'email': email,
        'private_key': 'test',
        'public_key': 'test'
      });
    } catch (error) {
      debugPrint("Creating keypair and uploading error: $error");
    }
  }
}
