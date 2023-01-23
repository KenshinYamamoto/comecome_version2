import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TitleScreen'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
