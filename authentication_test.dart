import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group('Authentication Tests', () {
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
    });

    test('Login com credenciais válidas', () async {
      // Mock do comportamento de login
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'teste@guardiao.com',
        password: '123456',
      )).thenAnswer((_) async => MockUserCredential());

      final user = await mockFirebaseAuth.signInWithEmailAndPassword(
        email: 'teste@guardiao.com',
        password: '123456',
      );

      expect(user, isNotNull);
    });
  });
}