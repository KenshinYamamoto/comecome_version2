import 'package:flutter/material.dart';

import '../models/take_hand_model.dart';

class TakeHandScreen extends StatefulWidget {
  const TakeHandScreen({super.key});

  @override
  State<TakeHandScreen> createState() => _TakeHandScreenState();
}

class _TakeHandScreenState extends State<TakeHandScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget onGenerateTabCard(String titleText) {
      return SizedBox(
        height: deviceHeight * 0.1,
        width: deviceWidth * 0.4,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            // TODO 押した時の処理を追加
            onTap: () {},
            onLongPress: () {},
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
        leading: const Icon(Icons.abc), // TODO 画像の表示
        title: Text(
          count % 2 == 0 ? '取って欲しい①' : '取って欲しい②',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrange[300],
        actions: const [
          Icon(Icons.abc), // TODO 画像の表示
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/CommonParts/back_color01.png'),
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
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 5,
                            ),
                          ),
                          child: InkWell(
                            // TODO 押した時の処理を追加
                            onTap: () {},
                            onLongPress: () {},
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
                                          ? TakeHandModel.takeHandList1[i]
                                          : TakeHandModel.takeHandList2[i],
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
                          // TODO 押した時の処理を追加
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
                                    count % 2 == 0 ? '次へ' : '前へ',
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
              Container(
                height: deviceHeight * 0.12,
                color: Colors.deepOrange[300],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      onGenerateTabCard('トップ'),
                      onGenerateTabCard('手書き'),
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
        ],
      ),
    );
  }
}
