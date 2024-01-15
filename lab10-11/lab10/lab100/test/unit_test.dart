import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab100/main.dart';
import 'package:mockito/mockito.dart';
import 'package:lab100/firebase_test_config.dart';

//создание моков объектов, которые являются зависимостями модуля, который тестируется
class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  setUpAll(() async {
    await initializeFirebaseForTest(); // Инициализация Firebase
  });

  group('LoginScreen', () {
    final MockFirebaseAuth _auth = MockFirebaseAuth();

    test('Test login process', () async {
      final loginScreen = LoginPage();
      loginScreen.setEmail = 'user@gmail.com';
      loginScreen.setPassword = 'useruser';

      when(_auth.signInWithEmailAndPassword(
        email: 'user@gmail.com',
        password: 'useruser',
      )).thenAnswer((_) async => MockUserCredential());

      loginScreen.signIn();
    });
  });
}
