import 'package:flutter/material.dart';

void main() {
  runApp(const MyOptimizedApp());
}

class MyOptimizedApp extends StatelessWidget {
  const MyOptimizedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // ← HAS const
      title: 'Optimized App',
      home: HomePageOptimized(),
    );
  }
}

class HomePageOptimized extends StatefulWidget {
  const HomePageOptimized({super.key});

  @override
  State<HomePageOptimized> createState() => _HomePageOptimizedState();
}

class _HomePageOptimizedState extends State<HomePageOptimized> {
  final TextEditingController _controller = TextEditingController();
  String _displayText = '';

  void _updateDisplayText() {
    final newText = _controller.text;
    if (newText != _displayText) {
      setState(() {
        _displayText = newText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Optimized Home'), // ← HAS const
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // ← HAS const
        child: Column(
          children: [
            const TextField(
              // ← HAS const
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something',
              ),
            ),
            const SizedBox(height: 20), // ← HAS const
            ElevatedButton(
              onPressed: _updateDisplayText,
              child: const Text('Submit'), // ← HAS const
            ),
            const SizedBox(height: 20), // ← HAS const
            Text(
              _displayText,
              style: const TextStyle(fontSize: 18), // ← HAS const
            ),
            const SizedBox(height: 20), // ← HAS const
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SecondPageOptimized(), // ← HAS const
                  ),
                );
              },
              child: const Text('Go to Next Page'), // ← HAS const
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPageOptimized extends StatelessWidget {
  const SecondPageOptimized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'), // ← HAS const
      ),
      body: const Center(
        // ← HAS const
        child: Text('Navigation successful!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
