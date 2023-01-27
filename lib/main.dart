import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/title_screen.dart';
import './screens/take_hand_screen.dart';
import './screens/drink_screen.dart';
import './screens/health_management_screen.dart';
import './screens/memo_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
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
      home: const TitleScreen(),
      routes: {
        DrinkScreen.routeName: (context) => const DrinkScreen(),
        HealthManagementScreen.routeName: (context) =>
            const HealthManagementScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        TakeHandScreen.routeName: (context) => const TakeHandScreen(),
        MemoScreen.routeName: (context) => const MemoScreen(),
      },
    );
  }
}
