import 'package:flutter/material.dart';

import '../models/health_management_model.dart';
import '../widgets/text_to_speech.dart';
import '../widgets/bottom_tab.dart';
import '../widgets/generate_icon.dart';

class HealthManagementScreen extends StatelessWidget {
  static const routeName = '/health-management';
  const HealthManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget generateQuetion(String text) {
      return SizedBox(
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
                    text,
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
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5),
          child: FittedBox(
            child: Icon(
              Icons.help,
            ),
          ),
        ),
        title: const Text(
          'どうされましたか?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          GenerateIcon(
            height: deviceWidth * 0.2,
            width: deviceWidth * 0.2,
            background: false,
            iconPath: 'assets/images/HealthManagementScreen/stethoscope.png',
          ),
        ],
        backgroundColor: Colors.green.shade200,
      ),
      body: Stack(
        children: [
          GenerateIcon(
            height: deviceHeight,
            width: deviceWidth,
            background: true,
            iconPath: 'assets/images/HealthManagementScreen/back_color03.png',
          ),
          Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < HealthManagementModel.conditions.length;
                        i++) ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0;
                              j < HealthManagementModel.conditions[i].length;
                              j++) ...{
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
                                  onTap: () {
                                    TextToSpeech.speak(HealthManagementModel
                                        .speakConditions[i][j]);
                                  },
                                  onLongPress: () {
                                    TextToSpeech.speak(HealthManagementModel
                                        .speakConditions[i][j]);
                                  },
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        HealthManagementModel.conditions[i][j],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          },
                        ],
                      ),
                    },
                  ],
                ),
              ),
              generateQuetion('どこが?'),
              SizedBox(
                height: deviceHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < HealthManagementModel.sites.length;
                        i++) ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0;
                              j < HealthManagementModel.sites[i].length;
                              j++) ...{
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
                                  onTap: () {
                                    TextToSpeech.speak(
                                      HealthManagementModel.sites[i][j],
                                    );
                                  },
                                  onLongPress: () {
                                    TextToSpeech.speak(
                                      HealthManagementModel.sites[i][j],
                                    );
                                  },
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        HealthManagementModel.sites[i][j],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          },
                        ],
                      ),
                    },
                  ],
                ),
              ),
              generateQuetion('どうしたい?'),
              SizedBox(
                height: deviceHeight * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0;
                        i < HealthManagementModel.wants.length;
                        i++) ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (int j = 0;
                              j < HealthManagementModel.wants[i].length;
                              j++) ...{
                            SizedBox(
                              height: deviceHeight * 0.25 * 0.35,
                              width: i == 0
                                  ? deviceWidth * 0.5
                                  : deviceWidth * 0.3,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    TextToSpeech.speak(
                                      HealthManagementModel.speakWants[i][j],
                                    );
                                  },
                                  onLongPress: () {
                                    TextToSpeech.speak(
                                      HealthManagementModel.speakWants[i][j],
                                    );
                                  },
                                  child: FittedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        HealthManagementModel.wants[i][j],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          },
                        ],
                      ),
                    },
                  ],
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
