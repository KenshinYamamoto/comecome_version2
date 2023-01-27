import 'package:flutter/material.dart';

import '../screens/health_management_screen.dart';
import '../screens/drink_screen.dart';
import '../screens/take_hand_screen.dart';

class HomeWidgetsModel {
  static List<Map<String, dynamic>> homeWidgets = [
    {
      'iconPath': 'assets/images/HomeScreen/thanks_icon.png',
      'color': Colors.pinkAccent,
      'title': 'ありがとう',
      'speakText': 'ありがとうございます',
      'routeName': '',
    },
    {
      'iconPath': 'assets/images/HomeScreen/toilet_icon.png',
      'color': Colors.blue,
      'title': 'トイレ',
      'speakText': 'トイレに連れて行ってください',
      'routeName': '',
    },
    {
      'iconPath': 'assets/images/HomeScreen/pain_icon.png',
      'color': Colors.red,
      'title': 'つらい',
      'speakText': 'どうされましたか?',
      'routeName': HealthManagementScreen.routeName,
    },
    {
      'iconPath': 'assets/images/HomeScreen/cold_drink_icon.png',
      'color': Colors.blue[300]!,
      'title': '飲みたい',
      'speakText': '何を飲みたいですか?',
      'routeName': DrinkScreen.routeName,
    },
    {
      'iconPath': 'assets/images/HomeScreen/heating_icon.png',
      'color': Colors.orange,
      'title': '暑い/寒い',
      'speakText': '気温を調節してください',
      'routeName': '',
    },
    {
      'iconPath': 'assets/images/HomeScreen/hand_icon.png',
      'color': Colors.greenAccent,
      'title': '取って!',
      'speakText': '何が欲しいですか?',
      'routeName': TakeHandScreen.routeName,
    },
  ];
}
