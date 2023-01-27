import 'package:flutter/material.dart';

import '../widgets/bottom_tab.dart';
import '../models/drink_model.dart';
import '../widgets/text_to_speech.dart';

class DrinkScreen extends StatefulWidget {
  static const routeName = '/drink';
  const DrinkScreen({super.key});

  @override
  State<DrinkScreen> createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  int count = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.abc), // TODO 画像の表示
        title: Text(
          count % 2 == 0 ? '温かい飲み物' : '冷たい飲み物',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: count % 2 == 0 ? Colors.red : Colors.blue,
        actions: const [
          Icon(Icons.abc), // TODO 画像の表示
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: count % 2 == 0
                    ? const AssetImage(
                        'assets/images/CommonParts/back_color01.png')
                    : const AssetImage(
                        'assets/images/ColdDrinkScreen/back_color02.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 6; i++) ...{
                      SizedBox(
                        height: deviceHeight * 0.75 * 0.16,
                        width: deviceWidth,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: count % 2 == 0 ? Colors.red : Colors.blue,
                              width: 5,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              TextToSpeech.speak(
                                '${count % 2 == 0 ? DrinkModel.hotDrinkList[i] : DrinkModel.coldDrinkList[i]}が飲みたいです',
                              );
                            },
                            onLongPress: () {
                              TextToSpeech.speak(
                                '${count % 2 == 0 ? DrinkModel.hotDrinkList[i] : DrinkModel.coldDrinkList[i]}が飲みたいです',
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.abc), // TODO 画像の表示
                                  FittedBox(
                                    child: Text(
                                      count % 2 == 0
                                          ? DrinkModel.hotDrinkList[i]
                                          : DrinkModel.coldDrinkList[i],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: deviceWidth * 0.1,
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
                      ),
                    }
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      height: deviceHeight * 0.1,
                      width: deviceWidth * 0.4,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.abc), // TODO 画像の表示
                                FittedBox(
                                  child: Text(
                                    count % 2 == 0 ? '冷たい' : '温かい',
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
                    ),
                  ),
                ),
              ),
              BottomTab(
                receivedContext: context,
                showTopPage: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
