import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = '0';
  String _errorMessage = '';
  String _lastOperation = '';

  void _calculate(String operation) {
    setState(() {
      _errorMessage = '';
      _lastOperation = operation;

      // Validate inputs
      if (_num1Controller.text.isEmpty || _num2Controller.text.isEmpty) {
        _errorMessage = 'Please enter both numbers';
        _result = '0';
        return;
      }

      // Parse inputs
      final num1 = double.tryParse(_num1Controller.text);
      final num2 = double.tryParse(_num2Controller.text);

      if (num1 == null || num2 == null) {
        _errorMessage = 'Invalid number format';
        _result = '0';
        return;
      }

      // Check for overflow/underflow
      if (num1.abs() > 1e308 || num2.abs() > 1e308) {
        _errorMessage = 'Number too large';
        _result = '0';
        return;
      }

      // Perform calculation
      double result;
      try {
        switch (operation) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case '×':
            result = num1 * num2;
            break;
          case '÷':
            if (num2 == 0) {
              _errorMessage = 'Cannot divide by zero';
              _result = '∞';
              return;
            }
            result = num1 / num2;
            break;
          default:
            _errorMessage = 'Unknown operation';
            _result = '0';
            return;
        }

        // Check for infinity or NaN
        if (result.isInfinite) {
          _errorMessage = 'Result is too large';
          _result = '∞';
          return;
        }

        if (result.isNaN) {
          _errorMessage = 'Invalid calculation';
          _result = 'Error';
          return;
        }

        // Format result
        if (result == result.toInt()) {
          _result = result.toInt().toString();
        } else {
          _result = result.toStringAsFixed(6).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
        }
      } catch (e) {
        _errorMessage = 'Calculation error';
        _result = 'Error';
      }
    });
  }

  void _clear() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _result = '0';
      _errorMessage = '';
      _lastOperation = '';
    });
  }

  Widget _buildOperationButton(String symbol, Color color, IconData icon) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () => _calculate(symbol),
          child: Icon(icon, size: 32),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 9'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Number Input
            TextField(
              controller: _num1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: 'First Number',
                labelStyle: TextStyle(fontSize: 16, color: colorScheme.primary),
                prefixIcon: Icon(Icons.looks_one, color: colorScheme.primary),
                filled: true,
                fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Second Number Input
            TextField(
              controller: _num2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                labelText: 'Second Number',
                labelStyle: TextStyle(fontSize: 16, color: colorScheme.primary),
                prefixIcon: Icon(Icons.looks_two, color: colorScheme.primary),
                filled: true,
                fillColor: colorScheme.surfaceVariant.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: colorScheme.primary, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Operation Buttons
            Row(
              children: [
                _buildOperationButton('+', Colors.green.shade600, Icons.add),
                _buildOperationButton('-', Colors.orange.shade600, Icons.remove),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildOperationButton('×', Colors.blue.shade600, Icons.close),
                _buildOperationButton('÷', Colors.red.shade600, Icons.percent),
              ],
            ),
            const SizedBox(height: 20),

            // Clear Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: _clear,
              icon: const Icon(Icons.clear_all),
              label: const Text('Clear', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 32),

            // Result Box
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primaryContainer,
                    colorScheme.secondaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calculate,
                        color: colorScheme.onPrimaryContainer,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Result',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                  if (_lastOperation.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Operation: $_lastOperation',
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onPrimaryContainer.withOpacity(0.7),
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Text(
                    _result,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onPrimaryContainer,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (_errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red.shade300),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}
