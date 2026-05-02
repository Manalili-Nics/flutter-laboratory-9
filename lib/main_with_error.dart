import 'package:flutter/material.dart';

void main() {
  runApp(const MyFixedApp());
}

class MyFixedApp extends StatelessWidget {
  const MyFixedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fixed App', home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  String _displayText =
      ''; // FIXED BUG #1: Changed from 'Ready' to empty string

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fixed App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FIXED BUG #2: Added back the missing TextField
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something here',
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print('Button clicked - Current text: ${_textController.text}');
                setState(() {
                  _displayText = _textController.text.isEmpty
                      ? 'You typed nothing'
                      : 'You typed: ${_textController.text}';
                });
                print('Button clicked - New display text: $_displayText');
              },
              child: const Text('Show My Text'),
            ),

            const SizedBox(height: 20),

            Text(_displayText, style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                print('Navigation button clicked - Going to second screen');
                // FIXED BUG #3: Changed from pushNamed to proper navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

// FIXED BUG #3: Created the SecondScreen that navigation was trying to find
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(
        child: Text(
          'Navigation successful! 🎉',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
