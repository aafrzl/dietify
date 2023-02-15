import 'dart:io';

import 'package:diet_planner_app/models/intro_model.dart';
import 'package:diet_planner_app/screens/login_screen.dart';
import 'package:diet_planner_app/utils/colors.dart';
import 'package:diet_planner_app/utils/constant_data.dart';
import 'package:diet_planner_app/utils/constant_widget.dart';
import 'package:diet_planner_app/utils/data_file.dart';
import 'package:diet_planner_app/utils/pref_data.dart';
import 'package:diet_planner_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _position = 0;

  Future<bool> _requestPop() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(false);
  }

  final controller = PageController();

  List<IntroModel> introModelList = [];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    introModelList = DataFile.getIntroModel(context);

    double defMargin = getScreenPercentSize(context, 2);
    double radius = getScreenPercentSize(context, 3);
    double firstHeight = getScreenPercentSize(context, 55);
    setState(() {});

    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: firstHeight),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
              ),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
            ),
            PageView.builder(
              controller: controller,
              itemBuilder: (context, position) {
                return Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      height: firstHeight,
                      padding: EdgeInsets.all(
                        getScreenPercentSize(context, 10),
                      ),
                      child: Image.asset(introModelList[position].image!),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: firstHeight),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(defMargin),
                            child: getCustomText(
                                introModelList[position].name!,
                                Colors.white,
                                1,
                                TextAlign.start,
                                FontWeight.bold,
                                25),
                          ),
                          getCustomText(
                              introModelList[position].desc!,
                              Colors.white70,
                              3,
                              TextAlign.center,
                              FontWeight.w500,
                              ConstantData.font18Px),
                          Expanded(child: Container()),
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: introModelList.length,
              onPageChanged: _onPageViewChange,
            ),
            Container(
              margin: EdgeInsets.only(top: firstHeight),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(child: Container()),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: defMargin * 1.5),
                      child: InkWell(
                        child: Container(
                          height: getScreenPercentSize(context, 6.5),
                          margin: EdgeInsets.only(bottom: (defMargin)),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: statusBar,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                (defMargin / 2),
                              ),
                            ),
                          ),
                          child: InkWell(
                            child: Center(
                              child: getCustomTextWithoutAlign(
                                  'Lanjutkan',
                                  Colors.white,
                                  FontWeight.w800,
                                  ConstantData.font18Px),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_position < (introModelList.length - 1)) {
                            _position++; // position = 1
                            controller.jumpToPage(_position);
                            setState(() {});
                          } else {
                            // 1
                            PrefData.setIsFirstTime(1);
                            Navigator.of(context).pop(true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginHomePage(),
                              ),
                            );
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: introModelList.map((url) {
                        int index = introModelList.indexOf(url);
                        return Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _position == index
                                ? statusBar
                                : disableIconColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _onPageViewChange(int page) {
    _position = page;
    setState(() {});
  }
}
