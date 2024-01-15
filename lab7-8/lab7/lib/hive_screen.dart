import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class HiveScreen extends StatefulWidget {
  @override
  _HiveScreenState createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  final _boxName = 'myHiveBox1';
  final _dataKey = 'data';

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initHive().then((_) {
      _openBox().then((_) {
        _readDataFromHive();
      });
    });
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await _openBox();
  }

  Future<void> _openBox() async {
    await Hive.openBox(_boxName);
  }

  Future<void> _addToHive() async {
    final box = Hive.box(_boxName);
    await box.put(_dataKey, _textEditingController.text);
    setState(() {
      _textEditingController.text = '';
    });
  }

  Future<void> _updateHive() async {
    final box = Hive.box(_boxName);
    if (box.containsKey(_dataKey)) {
      await box.put(_dataKey, 'Что-то изменилось');
      setState(() {
        _textEditingController.text = '';
      });
    }
  }

  Future<void> _deleteFromHive() async {
    final box = Hive.box(_boxName);
    if (box.containsKey(_dataKey)) {
      await box.delete(_dataKey);
      setState(() {
        _textEditingController.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive экран'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 260,
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Введите текст',
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addToHive,
              child: Text('Добавить в Hive'),
            ),
            ElevatedButton(
              onPressed: _updateHive,
              child: Text('Изменить в Hive'),
            ),
            ElevatedButton(
              onPressed: _deleteFromHive,
              child: Text('Удалить из Hive'),
            ),
            SizedBox(height: 20),
            FutureBuilder(
              future: _readDataFromHive(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text('Данные в Hive: ${snapshot.data}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _readDataFromHive() async {
    final box = Hive.box(_boxName);
    if (box.containsKey(_dataKey)) {
      return box.get(_dataKey) as String;
    }
    return '';
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}