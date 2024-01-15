import 'package:lab2/lab2.dart' as lab2;
import 'dart:convert';
import 'dart:async';


void main(List<String> arguments){
  print('Hello world: ${lab2.calculate()}!');

  DressingMan alex = DressingMan(115, "Aleksandra", "Kohnyuk", 20, "Footwear");
  alex.student();
  alex.cloth();
  alex.value();
  print("---------------------------------------------------------------");
  
  DressingMan sergey = DressingMan(125, "Sergey", "Chistyakov", 23, "Hoodies");
  sergey.student();
  sergey.cloth();
  sergey.value();

  //Comparable-сравнение
  print("----------Comparable-----------");
  PriceCloth Bag = PriceCloth(50,"Bag");
  PriceCloth Glasses = PriceCloth(70,"Glasses");
  print(Bag.compareTo(Glasses));

  if(Bag.compareTo(Glasses) == 1){
    print("Glasses дешевле чем Bag");
  }
  else{
    print("Glasses дороже чем Bag");
  }

/* var numbers = NumberIterator(5);
while (numbers.moveNext()) {
print(numbers.current);
}*/
  //итерация эл
  print("-------Iterator & Iterable-------");
  NumberIterator num= NumberIterator(5);
  print("Current:");
  print(num.current);
  print("After methods moveNext");
  num.moveNext();
  print(num.current);

  print("-------JSON-------");
  String json = jsonEncode(alex.toJson());
  print(json);

/*
print("-------Асинхронный метод & Future<T>-------");
doWork();
print("Выполнение функции main");*/

  print("--------Single Substraction && Broadcast Substraction-------");

  StreamController<int> streamController = StreamController<int>();//неявный однократный поток
  Stream<int> stream = streamController.stream.asBroadcastStream();
  StreamSubscription<int> subscription = stream.listen((data) {
    print('Полученное значение: $data');
  });

  streamController.sink.add(1);
  streamController.sink.add(2);
  streamController.sink.add(3);

  streamController.close();

  StreamController<int> streamController1 = StreamController<int>.broadcast();
  Stream<int> stream1 = streamController1.stream;

  // Подписка на Stream-поток и обработка значений.
  StreamSubscription<int> subscription1 = stream1.listen((data1) {
    print('Полученное значение: $data1');
  });

  streamController1.sink.add(4);
  streamController1.sink.add(5);
  streamController1.sink.add(6);

  streamController1.close();
}

//mixin класс
mixin class Student{
  String name = " ";
  String surname = " ";
  int age = 0;

  void student() => print("name: $name, surname:$surname, age:$age");
}

//чистый mixin
mixin Cloth{
  String name_cloth = " ";

  void cloth() => print("likes to wear: $name_cloth");
}

//применение mixin
class DressingMan with Cloth,Student{

  int price = 0;

  DressingMan(this.price, String new_name, String new_surname, int new_age, String new_name_cloth){
  name = new_name;
  surname = new_surname;
  age = new_age;
  name_cloth = new_name_cloth;
}
void value()=> print("Price of clothes $price");

// Метод toJson для сериализации объекта в JSON
Map<String, dynamic> toJson() {
  return {
  'price': price,
  'name': name,
  'surname': surname,
  'age': age,
  'name_cloth': name_cloth,
  };
}
}

class PriceCloth with Cloth implements Comparable<PriceCloth>
{
  int price = 0;
  PriceCloth(this.price, String new_name){
    name_cloth= new_name;
  }
  String getName(){return name_cloth;}

  @override
  int compareTo(PriceCloth p) => price.compareTo(p.price);
}

class NumberIterator extends Iterable implements Iterator {
  int _current = 0;
  int _end;

  NumberIterator(this._end);

  @override
  int get current => _current;

  @override
  bool moveNext() {
  _current++;
  return _current <= _end;
  }

  @override
  Iterator get iterator => this;
}

Future<void> doWork() async {
  print("Начало функции doWork");
  String message = await getMessage();
  print("Получено сообщение: $message");
  print("Завершение функции doWork");
}

Future<String> getMessage() {
  return Future.delayed(Duration(seconds: 1), () => "Hello Dart");
}