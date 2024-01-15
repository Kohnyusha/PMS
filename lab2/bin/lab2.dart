import 'package:lab2/lab2.dart' as lab2;

void main(){
print('Hello world: ${lab2.calculate()}!');

print("--------------Объекты классов наследников--------------");
Hoodies hoodies = Hoodies("Hoodies", 159.99);// классы наследники
Footwear footwear = Footwear("Footwear", 655.99);
hoodies.display();
footwear.display();

print("---------------------Интерфейс-------------------------");

DressingMan alex = DressingMan('Aleksandra',20,'Footwear');//интерфейс
alex.dressing();

print("-----------------Абстрактный класс---------------------");

Budget glasses = Accessory(45.99); //абстрактный класс
glasses.countBudget();

//конструкторы
print("--------------------Конструктор--------------------");
ClothingCategory obj1 = ClothingCategory("Footwear");
print(obj1.brands);
print("--------------Именованный конструктор-----------------");
ClothingCategory obj2 = ClothingCategory.Price(12.99);
print(obj2.brands);

//именованные функции
print("--------------------Именованные функции-------------------------");
void clothes({String name ="undefined"}){
  print("Name: $name");   
}
clothes(name:"Jeans");

//c параметрами по умолчанию(необяз. парам.)
print("--------c параметрами по умолчанию(необяз. парам.)-------------------");
void showPerson([String name = "Sergey", int age = 23 ]){
  print("Name: $name");
  print("Age: $age\n");
}
showPerson();

print("--------с параметром типа функция-------------------");
// с параметром типа функция
void showOther(Function func){
  func();
}

showOther(showPerson);

//list
print("----------------Массив----------------------------");
List<String> list= ["Footwear", "Hoodies", "Jeans"];
  print(list);
  print(list.last);
  print(list.length);
  list.add("T-shirt");
  print(list.reversed);

print("----------------Коллекция----------------------------");
Map<int, String> map ={
  1:"Footwear",
  2:"Hoodies",
  3:"Jeans"
};

print(map);
print("Length: ${map.length}");
print("Empty: ${map.isEmpty}");
print(map.keys);
print(map.values);

print("----------------Множество----------------------------");
Set <String> sets = {
  'Jeans',
  'Hoodies',
  'Footwear',
};

print(sets);
sets.add("T-shirt");
print(sets);
sets.remove("Footwear");
print(sets);

print("----------------Исключения----------------------------");
try{
  DressingMan julia = DressingMan("Julia", -18, "Footwear");
  print(julia.age);
}
on AgeException catch(e){
  print(e);
  print(e.value);
}

print("----------------Continue & break----------------------------");
for (int i=1; i< 20; i++){
  if(i % 3 != 0){
    continue;
  }
  if(i == 20){
  break;
  }
  else
  print("Число кратное 3 : $i");
  }
}

class Clothing{
  String brand;
  double price;

  String get _brand {return brand;}
  double get _price {return price;}

  set _brand(String value){
    if(value.length > 0 && value.length < 45 )
    {
      _brand = value;
    }
  }

  set _price(double value){
    if(value > 1.01 && value < 999.99 )
    {
      _price = value;
    }
  }
  // константный конструктор
  Clothing(this.brand, this.price);

  void display(){
    print("Brand: $brand, price: $price BYN");
  }
}

class Footwear extends Clothing {
  Footwear(brand, price): super(brand, price); //вызов конструктора (super)
}

class Hoodies extends Clothing{
  Hoodies(brand, price): super(brand, price); //вызов конструктора (super)
}

//конструктор
class ClothingCategory{
  String brands='';

  ClothingCategory(this.brands);
  ClothingCategory.Price(double price){
    brands = "Price: $price BYN";
  }
}

class DressingMan implements ClothingCategory{
  String nameMan = "";
  int age = 20;
  @override
  String brands='';

  DressingMan(this.nameMan, age, this.brands){
    if(age < 1 || age > 110)
    throw AgeException(age);
  }

  void dressing() => print("Name man: $nameMan, age: $age likes to wear $brands");
}

abstract class Budget{
  void countBudget();
}

class Accessory extends Budget{
  double price = 0;
  Accessory(this.price);

  @override
  void countBudget(){
    double countBudgetMan = 999.99 - price;
    print('If Aleksandra buys glasses, then he will have: $countBudgetMan BYN');
  }
}

class AgeException implements Exception{
  int value;
  AgeException(this.value);
  @override
  String toString() =>"Неверно указан возраст";
}