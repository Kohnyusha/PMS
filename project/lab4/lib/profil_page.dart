import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Profile',
        style: TextStyle(
                        color: const Color.fromARGB(255, 199, 199, 199),
                        fontSize: 22,
                        
                      ),
        ),
        
        
        actions: [
          Stack(
            children: [
              
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity, // Ширина контейнера по всей ширине экрана
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                'Aleksandra Kohnyuk',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Birth: July 18, 2003',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Обработка действия выхода
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}