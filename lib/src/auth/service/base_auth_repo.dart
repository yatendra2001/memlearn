abstract class BaseAuthRepo {
  Future<void> signUpWithEmailPassword(
      {required String email, required String password});

  Future<void> signInWithEmailPassword(
      {required String email, required String password});

  Future<void> createAndUploadKeypair({required String email});
}
