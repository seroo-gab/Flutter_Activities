import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 7',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const CapitalCitiesScreen(),
    );
  }
}

class CapitalCitiesScreen extends StatelessWidget {
  const CapitalCitiesScreen({super.key});

  final List<Map<String, String>> cities = const [
    {'city': 'Manila', 'country': 'Philippines'},
    {'city': 'Tokyo', 'country': 'Japan'},
    {'city': 'Seoul', 'country': 'South Korea'},
    {'city': 'Beijing', 'country': 'China'},
    {'city': 'Bangkok', 'country': 'Thailand'},
    {'city': 'Hanoi', 'country': 'Vietnam'},
    {'city': 'Jakarta', 'country': 'Indonesia'},
    {'city': 'Kuala Lumpur', 'country': 'Malaysia'},
    {'city': 'Singapore', 'country': 'Singapore'},
    {'city': 'New Delhi', 'country': 'India'},
    {'city': 'Islamabad', 'country': 'Pakistan'},
    {'city': 'Dhaka', 'country': 'Bangladesh'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 7'),
        centerTitle: true,
        elevation: 8.0,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[900],
            elevation: 4.0,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                cities[index]['city']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Capital of ${cities[index]['country']}',
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: const Icon(Icons.location_city, color: Colors.white54),
            ),
          );
        },
      ),
    );
  }
}
