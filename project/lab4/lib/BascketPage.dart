import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_bloc.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = Provider.of<ProductBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Переход на предыдущую страницу
          },
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: const BasketPage(),
                        );
                      },
                    ),
                  );
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
                  child: Consumer<ProductBloc>(
                    builder: (context, productBloc, child) {
                      return Text(
                        productBloc.quantity.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: productBloc.quantity == 0
            ? Center(
                child: Consumer<ProductBloc>(
                  builder: (context, productBloc, child) {
                    return Text(
                      productBloc.isBasketCleared ? 'Cart is empty' : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    );
                  },
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                            'assets/images/clothes_women.jpg',
                            width: 80,
                            height: 80,
                            ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Armani Woman Coat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Consumer<ProductBloc>(
                              builder: (context, productBloc, child) {
                                return Text(
                                  'Amount: ${productBloc.quantity}',
                                  style: const TextStyle(
                                    color: const Color.fromARGB(255, 193, 193, 193),
                                    fontSize: 16,
                                  ),
                                );
                              },
                            ),
                            Text(
                              'Price: \$ 1.200',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 193, 193, 193),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            productBloc.decrementQuantity(); // Удаление товара из корзины
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Center(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: ElevatedButton(
                        onPressed: () {
                          productBloc.clearBasket(); // Очистка корзины
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Purchase Successful!'),
                                content: Text('The purchase was successful!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Закрыть диалоговое окно
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Buy'),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}