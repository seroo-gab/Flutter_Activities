import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Activity 4')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/local_image.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),
              Image.network(
                 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
               width: 120,
               height: 120,
                 fit: BoxFit.cover,
              ),

              const SizedBox(height: 36),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/atk.png', width: 40, height: 40),
                  const SizedBox(width: 24),
                  Image.asset('assets/tank.png', width: 40, height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
