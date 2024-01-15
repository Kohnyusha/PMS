import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesScreen extends StatefulWidget {
  @override
  _SharedPreferencesScreenState createState() => _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  String? savedData = 'Нет никаких данных';

  // Метод для чтения данных из Shared Preferences
  Future<void> _readData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedData = prefs.getString('data_key') ?? 'Нет никаких данных';
    });
  }

  // Метод для сохранения данных в Shared Preferences
  Future<void> _saveData(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data_key', data);
  }

  // Метод для удаления данных из Shared Preferences
  Future<void> _deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('data_key');
    setState(() {
      savedData = 'Данные удалены';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Данные: $savedData'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _readData();
              },
              child: Text('Чтение данных'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveData('Привет от Shared Preferences!');
              },
              child: Text('Сохранить данные'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _deleteData();
              },
              child: Text('Удалить данные'),
            ),
          ],
        ),
      ),
    );
  }
}
