import 'package:flutter/material.dart';
import 'package:lab7/hive_screen.dart';
import 'package:lab7/shared_preferences_screen.dart';
import 'package:lab7/sqflite_screen.dart';

import 'file_system_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 162, 0, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Мое приложение с БД'),
      initialRoute: '/', // Начальный маршрут
      routes: {
        '/home': (context) => const MyHomePage(title: 'Мое приложение с БД'), // Главная страница
        '/sqflite_screen': (context) => SQFLiteScreen(), // Страница SQFLite
        '/shared_preferences_screen': (context) => SharedPreferencesScreen(),
        '/file_system_screen': (context) => FileSystemScreen(),
        '/hive_screen': (context) => HiveScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sqflite_screen');
              },
              child: Text(
                'Перейти к SQFLite Screen',
                style: TextStyle(
                  fontSize: 20,
                        ),
                ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shared_preferences_screen');
              },
              child: Text(
                'Перейти к SharedPreferences Screen',
                style: TextStyle(
                  fontSize: 20,
                  ),
                ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/file_system_screen');
              },
              child: Text(
                'Перейти к FileSystem Screen',
                style: TextStyle(
                  fontSize: 20,
                  ),
                ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hive_screen');
              },
              child: Text(
                'Перейти к Hive Screen',
                style: TextStyle(
                  fontSize: 20,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
