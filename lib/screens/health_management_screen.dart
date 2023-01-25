import 'package:flutter/material.dart';

import '../models/health_management_model.dart';
import './home_screen.dart';
import './memo_screen.dart';

class HealthManagementScreen extends StatelessWidget {
  static const routeName = '/health-management';
  const HealthManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

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
        leading: const Icon(Icons.abc), // TODO 画像の表示
        title: const Text(
          'どうされましたか?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.abc), // TODO 画像の表示
        ],
        backgroundColor: Colors.green.shade200,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/HealthManagementScreen/back_color03.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 3; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.45,
                            width: deviceWidth * 0.3,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 5,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.condition[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 3; i < 6; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.45,
                            width: deviceWidth * 0.3,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 5,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.condition[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
                width: deviceWidth * 0.7,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
                  child: Container(
                    color: Colors.green.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.help,
                          size: deviceWidth * 0.1,
                          color: Colors.white,
                        ),
                        FittedBox(
                          child: Text(
                            'どこが?',
                            style: TextStyle(
                              fontSize: deviceWidth * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('') // 空要素
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 4; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.35,
                            width: deviceWidth * 0.25,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.site[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 4; i < 8; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.35,
                            width: deviceWidth * 0.25,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 3,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.site[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
                width: deviceWidth * 0.7,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
                  child: Container(
                    color: Colors.green.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.help,
                          size: deviceWidth * 0.1,
                          color: Colors.white,
                        ),
                        FittedBox(
                          child: Text(
                            'どうしたい?',
                            style: TextStyle(
                              fontSize: deviceWidth * 0.08,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('') // 空要素
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 2; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.35,
                            width: deviceWidth * 0.5,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.want[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 2; i < 5; i++) ...{
                          SizedBox(
                            height: deviceHeight * 0.25 * 0.35,
                            width: deviceWidth * 0.3,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ),
                              ),
                              child: InkWell(
                                // TODO 押した時の処理を追加
                                onTap: () {},
                                onLongPress: () {},
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      HealthManagementModel.want[i],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        }
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: deviceHeight * 0.12,
                    color: Colors.deepOrange[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          onGenerateTabCard('トップ', () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName, (route) => false);
                          }),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 35),
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
        ],
      ),
    );
  }
}
