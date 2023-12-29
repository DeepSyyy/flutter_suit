import 'package:flutter/material.dart';

class SecondScreenPage extends StatelessWidget {
  const SecondScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Center(
        child: Text(
          'Second Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
