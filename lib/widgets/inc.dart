import 'package:flutter/material.dart';

class Inc extends StatelessWidget {
  final double deviceHeight;
  const Inc({super.key, required this.deviceHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.03,
      color: Colors.deepOrange[300],
      child: const Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
          child: FittedBox(
            child: Text(
              'produced by comecome',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
