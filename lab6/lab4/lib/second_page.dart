import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab4/product.dart';

class SecondPage extends StatefulWidget {
  final Product product;
  const SecondPage({super.key, required this.product});

  @override
  _SecondPageState createState() => _SecondPageState(product: product);
}

class _SecondPageState extends State<SecondPage> {
  
  final Product product;
  int quantity = 3;
  late int batteryLevel;

  _SecondPageState({required this.product}){
    getBatteryLevel();
    batteryLevel = 94;
  }

  void incrementQuantity() {
    setState(() {
      if (quantity < 9) {
        quantity++;
      }
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  final platform = const MethodChannel('battery');

  void getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      setState(() {
        batteryLevel = result;
      });
    } on PlatformException catch (e) {
      print("Failed to get battery level: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: widget.product.imagePaths.map((path) {
              return Image.asset(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            }).toList(),//преобразование в список и список в кач дочерних элементов для PageView
          ),
          /*Image.asset(
            'assets/images/clothes_women.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),*/
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: () {

                        },
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.deepPurpleAccent,
                          ),
                          child: const Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 300),
              Text(
                'Battery Level: ${batteryLevel}%',
                style: const TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  SizedBox(width: 14),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/armani.png'),
                      radius: 20,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Armani',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Faux-fur coat with lapels',
                        style: TextStyle(
                          color: Color.fromARGB(255, 52, 52, 52),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              const SizedBox(height: 1),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.topLeft,
                child: const Column(
                  children: [
                    Text(
                      'Armani Woman Coat',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 44,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              Container(
                height: 203,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 24),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 96,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          child: const Column(
                            children: [
                              Text(
                                'Size           ',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'S                ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: 96,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(8.0),
                          child: const Column(
                            children: [
                              Text(
                                'Color         ',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'Azure        ',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 108,
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            width: 140,
                            height: 64,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: decrementQuantity,
                                  color: Colors.white,
                                ),
                                Text(
                                  quantity.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: incrementQuantity,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 28),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            width: 140,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(0.0),
                            child: const Column(
                              children: [
                                Text(
                                  'Price           ',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '\$ 1.200       ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 32),
                        ElevatedButton.icon(
                          onPressed: () {
                          },
                          icon: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurpleAccent,
                            fixedSize: const Size.fromHeight(156),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}