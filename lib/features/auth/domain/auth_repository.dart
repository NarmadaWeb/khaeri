import 'package:flutter_riverpod/flutter_riverpod.dart';

// Dummy Firebase implementation since we don't have real google-services.json
abstract class AuthRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
  Future<void> signOut();
  Stream<String?> get authStateChanges;
}

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<void> signIn(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signUp(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> signOut() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Stream<String?> get authStateChanges => Stream.value(null);
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});
