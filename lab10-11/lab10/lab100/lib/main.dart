import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mockito/mockito.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get firebaseAuth => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  set setEmail(String email) {
    emailController.text = email;
  }

  set setPassword(String password) {
    passwordController.text = password;
  }


  get showPinkToastCallCount => null;

  get showPinkToastLastArgs => null;

  set navigator(MockNavigator navigator) {}

  set firebaseAuth(MockFirebaseAuth firebaseAuth) {}

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        showPinkToast("Успешный вход");

        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OtherScreen()),
          );
        });
      } catch (e) {
        print('Ошибка входа: $e');
        showPinkToast("Ошибка входа");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  labelStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: signIn,
              child: Text(
                'Войти',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPinkToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  signIn() {}
}

class MockNavigator {
}

class MockFirebaseAuth {
  void when({required Future Function(dynamic email, dynamic password) signInWithEmailAndPassword}) {}
}
class OtherScreen extends StatelessWidget {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('products').doc('product_id').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Произошла ошибка: ${snapshot.error}');
            }
            if (snapshot.hasData) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              final productName = data['name'] as String;
              final productPrice = data['price'] as double;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Имя товара: $productName'),
                  Text('Цена: $productPrice \$'),
                ],
              );
            }
            return Text('Данные не найдены');
          },
        ),
      ),
    );
  }
}