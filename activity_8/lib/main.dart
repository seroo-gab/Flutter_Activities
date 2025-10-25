import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Activity 8: Counter App',
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;
  bool _isDarkMode = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode ? Colors.grey[900]! : Colors.white;
    final textColor = _isDarkMode ? Colors.white : Colors.black;
    final appBarColor = _isDarkMode ? Colors.grey[850]! : const Color.fromARGB(255, 201, 201, 201);
    final cardColor = _isDarkMode ? Colors.grey[800]! : Colors.grey[100]!;
    final fabBackgroundColor = _isDarkMode ? Colors.white : Colors.black;
    final fabIconColor = _isDarkMode ? Colors.black : const Color.fromARGB(255, 201, 201, 201);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Activity 8',
          style: TextStyle(color: textColor),
        ),
        centerTitle: true,
        elevation: 8.0,
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18, color: textColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Count box with shadow
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Reset Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                elevation: 6.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _resetCounter,
              child: const Text('Reset', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: fabBackgroundColor,
        elevation: 8.0,
        child: Icon(Icons.add, size: 30, color: fabIconColor),
      ),
      bottomNavigationBar: Container(
        color: _isDarkMode ? Colors.grey[850] : const Color.fromARGB(255, 201, 201, 201),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, color: textColor),
            const SizedBox(width: 12),
            Switch(
              value: _isDarkMode,
              onChanged: _toggleDarkMode,
              activeThumbColor: Colors.teal,
            ),
            const SizedBox(width: 12),
            Icon(Icons.nightlight_round, color: textColor),
          ],
        ),
      ),
    );
  }
}
