import 'package:flutter/material.dart';

import './health_management_screen.dart';
import './drink_screen.dart';
import './take_hand_screen.dart';
import './memo_screen.dart';
import '../widgets/text_to_speech.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;
    final cardHeight = deviceHeight * 0.85 * 0.16;

    Widget onGenerateCard(
        Color color, String titleText, VoidCallback tapFunction) {
      return SizedBox(
        height: cardHeight,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: color,
              width: 5,
            ),
          ),
          child: InkWell(
            onTap: () => tapFunction(),
            onLongPress: () => tapFunction(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.abc), // TODO 画像の表示
                  FittedBox(
                    child: Text(
                      titleText,
                      style: TextStyle(
                        fontSize: cardHeight * 0.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(Icons.volume_up),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight * 0.85,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/CommonParts/back_color01.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      onGenerateCard(
                        Colors.pinkAccent,
                        'ありがとう',
                        () {
                          TextToSpeech.speak('ありがとうございます');
                        },
                      ),
                      onGenerateCard(
                        Colors.blue,
                        'トイレ',
                        () {
                          TextToSpeech.speak('トイレに連れて行ってください');
                        },
                      ),
                      onGenerateCard(
                        Colors.red,
                        'つらい',
                        () {
                          TextToSpeech.speak('どうされましたか?');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            HealthManagementScreen.routeName,
                            (route) => false,
                          );
                        },
                      ),
                      onGenerateCard(
                        Colors.blue[300]!,
                        '飲みたい',
                        () {
                          TextToSpeech.speak('何を飲みたいですか?');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            DrinkScreen.routeName,
                            (route) => false,
                          );
                        },
                      ),
                      onGenerateCard(
                        Colors.orange,
                        '暑い/寒い',
                        () {
                          TextToSpeech.speak('気温を調整してください');
                        },
                      ),
                      onGenerateCard(
                        Colors.greenAccent,
                        '取って!',
                        () {
                          TextToSpeech.speak('何が欲しいですか?');
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            TakeHandScreen.routeName,
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: deviceHeight * 0.12,
              color: Colors.deepOrange[300],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    onGenerateTabCard('使い方', /*TODO 処理を追加*/ () {}),
                    onGenerateTabCard('手書き', () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MemoScreen.routeName, (route) => false);
                    }),
                  ],
                ),
              ),
            ),
            Container(
              height: deviceHeight * 0.03,
              color: Colors.deepOrange[300],
              child: const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
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
          ],
        ),
      ),
    );
  }
}
