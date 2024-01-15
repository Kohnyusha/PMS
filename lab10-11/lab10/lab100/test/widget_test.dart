import 'package:lab100/simple_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  //тест гарантирует, что виджет HelloWorldWidget отображает текст "Hello, World!"
  testWidgets('HelloWorld widget shows correct text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HelloWorldWidget()));

    final textFinder = find.text('Hello, World!');
    expect(textFinder, findsOneWidget);

    Text textWidget = tester.widget(textFinder);
    expect(textWidget.data, 'Hello, World!');
  });

}


/*
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab100/main.dart';

void main() {
  // Initialize Firebase before running the tests
  setUpAll(() async {
    await Firebase.initializeApp();
  });
  testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final signInButton = find.text('Войти');

    // Проверяем, что кнопка "Войти" отображается
    expect(signInButton, findsOneWidget);

    // Создаем кастомный поиск на основе LabelText
    Finder textFieldFinder(String labelText) {
      return find.byWidgetPredicate(
        (widget) =>
            widget is TextField &&
            widget.decoration?.labelText == labelText,
      );
    }

    // Находим и вводим значения в текстовые поля
    final emailTextField = textFieldFinder('Email');
    final passwordTextField = textFieldFinder('Пароль');

    expect(emailTextField, findsOneWidget);
    expect(passwordTextField, findsOneWidget);

    await tester.enterText(emailTextField, 'test@example.com');
    await tester.enterText(passwordTextField, 'password');

    // Нажимаем кнопку "Войти"
    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    // Проверяем, что было отображено сообщение об успешном входе
    expect(find.text('Успешный вход'), findsOneWidget);

    // Проверяем, что был выполнен переход на экран OtherScreen
    expect(find.byType(OtherScreen), findsOneWidget);
  });
}
*/