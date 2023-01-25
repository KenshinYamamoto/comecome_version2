import 'package:flutter/material.dart';

import './screens/title_screen.dart';
import './screens/take_hand_screen.dart';
import './screens/drink_screen.dart';
import 'screens/health_management_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HealthManagementScreen(),
    );
  }
}
