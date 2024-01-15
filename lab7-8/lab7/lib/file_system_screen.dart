import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileSystemScreen extends StatefulWidget {
  @override
  _FileSystemScreenState createState() => _FileSystemScreenState();
}

class _FileSystemScreenState extends State<FileSystemScreen> {
  String data = '';
  final TextEditingController _textEditingController = TextEditingController();

  // Метод для записи данных в файл
  Future<void> _writeToFile(String text) async {
    final file = File(await _getFilePath());
    await file.writeAsString(text);
  }

  // Метод для чтения данных из файла
  Future<void> _readFromFile() async {
    final file = File(await _getFilePath());
    if (await file.exists()) {
      setState(() {
        data = file.readAsStringSync();
      });
    } else {
      setState(() {
        data = 'Файл не найден';
      });
    }
  }

  // Метод для получения пути к файлу
  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/data.txt';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'File System экран'
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 260, // Ширина инпута
              child: TextField(
                controller: _textEditingController,
                textAlign: TextAlign.center, // Выравнивание по центру
                decoration: InputDecoration(labelText: 'Введите текст'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _writeToFile(_textEditingController.text);
              },
              child: Text('Записать в файл'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _readFromFile();
              },
              child: Text('Прочитать файл'),
            ),
            SizedBox(height: 20),
            Text('Данные в файле: $data'),
          ],
        ),
      ),
    );
  }
}
