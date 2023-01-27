import 'package:flutter/material.dart';

import '../widgets/text_to_speech.dart';
import '../widgets/bottom_tab.dart';
import '../widgets/generate_icon.dart';
import '../models/home_widgets_model.dart';

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

    Widget onGenerateCard(String iconPath, Color color, String titleText,
        VoidCallback tapFunction) {
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
                  GenerateIcon(
                    height: cardHeight * 0.5,
                    width: cardHeight * 0.5,
                    background: false,
                    iconPath: iconPath,
                  ),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        backgroundColor: Colors.deepOrange[300],
      ),
      body: Stack(
        children: [
          GenerateIcon(
            height: deviceHeight,
            width: deviceWidth,
            background: true,
            iconPath: 'assets/images/CommonParts/back_color01.png',
          ),
          Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.85,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < HomeWidgetsModel.homeWidgets.length;
                        i++) ...{
                      onGenerateCard(
                        HomeWidgetsModel.homeWidgets[i]['iconPath'],
                        HomeWidgetsModel.homeWidgets[i]['color'],
                        HomeWidgetsModel.homeWidgets[i]['title'],
                        () {
                          TextToSpeech.speak(
                              HomeWidgetsModel.homeWidgets[i]['speakText']);
                          try {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              HomeWidgetsModel.homeWidgets[i]['routeName'],
                              (route) => false,
                            );
                          } catch (_) {
                            return;
                          }
                        },
                      ),
                    },
                  ],
                ),
              ),
              BottomTab(
                receivedContext: context,
                showTopPage: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
