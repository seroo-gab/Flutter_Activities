import 'package:flutter/material.dart';

void main() {
  runApp(const MyFormApp());
}

class MyFormApp extends StatelessWidget {
  const MyFormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 6',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white10,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const FormScreen(),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  String email = '';

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return 'Enter your name';
    // Regex: allows letters (a-zA-Z), spaces, and period
    final valid = RegExp(r'^[a-zA-Z. ]+$');
    if (!valid.hasMatch(value)) return 'Only letters, spaces, and periods allowed';
    // Disallow numbers
    if (value.contains(RegExp(r'[0-9]'))) return 'Numbers not allowed';
    return null;
  }

  String? ageValidator(String? value) {
    if (value == null || value.isEmpty) return 'Enter your age';
    final intValue = int.tryParse(value);
    if (intValue == null) return 'Enter a valid integer age';
    if (intValue <= 0) return 'Age must be positive';
    if (value.contains('.')) return 'No decimals allowed';
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email';
    if (!value.contains('@')) return 'Email must contain "@"';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 6'),
        centerTitle: true,
        elevation: 8.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) => setState(() => name = value),
                validator: nameValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) => setState(() => age = value),
                validator: ageValidator,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => setState(() => email = value),
                validator: emailValidator,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(180, 50),
                ),
                child: const Text('Submit', style: TextStyle(fontSize: 18)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final snackBar = SnackBar(
                      backgroundColor: Colors.grey[900],
                      content: Text(
                        'Name: $name\nAge: $age\nEmail: $email',
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
