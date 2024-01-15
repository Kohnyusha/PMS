import 'package:flutter/material.dart';
import 'second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                                'assets/images/lady.jpg'),
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
                          SizedBox(width: 45),
                          Text(
                            'Ladies',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 38),
                          Text(
                            '2023',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 34),
                          Text(
                            'Men&W',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 36),
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
                  height: 1100,
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
                                        child: const SecondPage(),
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
                          const SizedBox(width: 16),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/вп.png'),
                              radius: 20,
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}

Material buildBottomNavigationBar() {
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