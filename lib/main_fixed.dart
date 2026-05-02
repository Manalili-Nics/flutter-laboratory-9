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
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fixed App - Working!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                setState(() {
                  _displayText = _textController.text.isEmpty
                      ? 'You typed nothing'
                      : 'You typed: ${_textController.text}';
                });
              },
              child: const Text('Show My Text'),
            ),
            const SizedBox(height: 20),
            Text(_displayText, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
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
