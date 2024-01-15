import 'package:flutter/material.dart';
import 'second_page.dart';
import 'package:provider/provider.dart';
import 'product_bloc.dart';
import 'profil_page.dart';
import 'stories_page.dart';
import 'bascketpage.dart';

void main() {
  runApp(
      ChangeNotifierProvider(//предоставляет виджетное дерево BloC
      create: (context) => ProductBloc(), // Экземпляр ProductBloc + подписка на его изменения
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashiongram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YourHomePage(),
    );
  }
}

class YourHomePage extends StatelessWidget {
  const YourHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productBloc = Provider.of<ProductBloc>(context, listen: false);//получить экземпляр предоставленного объекта из виджетного дерева
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          onPressed: () {
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
                  child: Consumer<ProductBloc>(//Consumer предоставляет доступ к экземпляру ProductBloc и перестроит только свое дочернее содержимое при изменении состояния ProductBloc
                    builder: (context, productBloc, child) {
                      return Text(
                        productBloc.quantity.toString(), // Отображаем количество товаров в корзине из ProductBloc
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
      body: ListView(
        children: [
          Container(
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  height: 104,
                  decoration: const BoxDecoration(
                    color: Color(0x22FFFFFF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: ExactAssetImage(
                                'assets/images/stories.jpg'),
                            radius: 25,
                          ),
                          SizedBox(width: 25),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/active.jpg'),
                            radius: 25,
                          ),
                          SizedBox(width: 25),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/man.jpg'),
                            radius: 25,
                          ),
                          SizedBox(width: 25),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/woman.jpg'),
                            radius: 25,
                          ),
                          SizedBox(width: 25),
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 25,
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 51),
                          
                          Text(
                            'Arts',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 45),
                          Text(
                            '2023',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 38),
                          Text(
                            'Men&W',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 37),
                          Text(
                            '90s',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 1120,
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/armani.png'),
                              radius: 20,
                            ),
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Armani',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '3 minutes ago',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const SizedBox(width: 4)
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation, secondaryAnimation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: SecondPage(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/clothes_women.jpg',
                                height: 390,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(height: 30),
                          SizedBox(width: 24, height: 20),
                          Text(
                            'Woman Coat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                        
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          IconButton(
                            icon: const Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const Text(
                            'Comments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 24),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const Text(
                            'Favorite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const SizedBox(width: 8)
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 160),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  productBloc.addToCart(1); // Добавление товара в корзину
                                },
                                child: Text('Add to Cart'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 16),
InkWell(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => StoryPage(),
      ),
    );
  },
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.deepPurple,
        width: 4.0,
      ),
    ),
    child: CircleAvatar(
      backgroundImage: AssetImage('assets/images/вп.png'),
      radius: 20,
    ),
  ),
),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dolce & Gabbana',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '15 minutes ago',
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const SizedBox(width: 4)
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              'assets/images/bag.jpg',
                              height: 405,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(height: 30),
                          SizedBox(width: 24, height: 20),
                          Text(
                            'Unique Woman Fashion Bag',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          IconButton(
                            icon: const Icon(
                              Icons.mode_comment_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const Text(
                            'Comments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 24),
                          IconButton(
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const Text(
                            'Favorite',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                            onPressed: () {

                            },
                          ),
                          const SizedBox(width: 8)
                        ],
                      ),
                      const SizedBox(height: 2)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}

Material buildBottomNavigationBar(BuildContext context) {
  return Material(
    child: Stack(
      alignment: Alignment.center,
      children: [
        BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(width: 24),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                radius: 14,
              ),
              label: '',
            ),
          ],
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          },
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 64,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
            ),
            child: const Center(
              child: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                radius: 24,
                child: Icon(
                  Icons.qr_code,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}