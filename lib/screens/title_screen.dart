import 'package:flutter/material.dart';

import './home_screen.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  Future<void> _pageTransition() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const HomeScreen();
        },
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        transitionsBuilder: ((context, animation, secondaryAnimation, child) {
          final color = ColorTween(
            begin: Colors.transparent,
            end: Colors.black,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.0,
              0.5,
              curve: Curves.easeInOut,
            ),
          ));
          final opacity = Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0.5,
              1.0,
              curve: Curves.easeInOut,
            ),
          ));
          return AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              return Container(
                color: color.value,
                child: Opacity(
                  opacity: opacity.value,
                  child: child,
                ),
              );
            },
            child: child,
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    _pageTransition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/TitleScreen/loading_screen.png',
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
