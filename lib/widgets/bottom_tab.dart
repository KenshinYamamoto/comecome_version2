import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/memo_screen.dart';
import './inc.dart';

class BottomTab extends StatelessWidget {
  final BuildContext receivedContext;
  final bool showTopPage;
  const BottomTab({
    super.key,
    required this.receivedContext,
    required this.showTopPage,
  });

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(receivedContext).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(receivedContext).padding.top;

    final deviceWidth = MediaQuery.of(receivedContext).size.width;

    Widget onGenerateTabCard(String titleText, VoidCallback tapFunction) {
      return SizedBox(
        height: deviceHeight * 0.1,
        width: deviceWidth * 0.4,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () => tapFunction(),
            onLongPress: () => tapFunction(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.abc), // TODO 画像の表示
                  FittedBox(
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: deviceHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: deviceHeight * 0.15,
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.12,
            color: Colors.deepOrange[300],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showTopPage
                      ? onGenerateTabCard(
                          'トップ',
                          () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName, (route) => false);
                          },
                        )
                      : onGenerateTabCard('使い方', () {}),
                  onGenerateTabCard(
                    '手書き',
                    () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MemoScreen.routeName, (route) => false);
                    },
                  ),
                ],
              ),
            ),
          ),
          Inc(deviceHeight: deviceHeight),
        ],
      ),
    );
  }
}
