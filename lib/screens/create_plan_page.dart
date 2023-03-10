import 'dart:io';

import 'package:diet_planner_app/models/api_calls.dart';
import 'package:diet_planner_app/models/daily_plans_models.dart';
import 'package:diet_planner_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../utils/constant_data.dart';
import '../utils/constant_widget.dart';
import '../utils/size_config.dart';

class CreatePlanPage extends StatefulWidget {
  final int? bmr; // 1898

  const CreatePlanPage({Key? key, this.bmr}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CreatePlanPage createState() {
    return _CreatePlanPage();
  }
}

class _CreatePlanPage extends State<CreatePlanPage> {
  Future<bool> _requestPop() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }

    return Future.value(false);
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double progressHeight = getWidthPercentSize(context, 50);
    double headerHeight = getWidthPercentSize(context, 35);

    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        backgroundColor: cellColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: cellColor,
          elevation: 0,
          title: const Text(""),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: headerHeight,
                  child: getTextWidget(
                      'BMR Anda ${widget.bmr} kKal',
                      textColor,
                      TextAlign.center,
                      FontWeight.w600,
                      MediaQuery.of(context).size.height * 0.038)),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1),
                duration: const Duration(seconds: 4),
                onEnd: () async {
                  DailyPlans dailyPlans = await ApiService.instance
                      .generateMealsPlans(targetCalories: widget.bmr!);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(dailyPlans: dailyPlans),
                    ),
                  );
                },
                builder: (context, value, _) {
                  double val = (value * 100 / 10) * 10;
                  var f = NumberFormat("###.##", "id_ID");

                  return SizedBox(
                    height: progressHeight,
                    width: progressHeight,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: progressHeight,
                          width: progressHeight,
                          child: CircularProgressIndicator(
                            strokeWidth: getPercentSize(progressHeight, 6),
                            value: value,
                            color: Colors.grey,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryColor),
                            backgroundColor: subTextColor.withOpacity(0.5),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              getTextWidget(
                                  "${f.format(val.round())} %",
                                  textColor,
                                  TextAlign.center,
                                  FontWeight.bold,
                                  getPercentSize(progressHeight, 15)),
                              getTextWidget(
                                  "Mohon tunggu...",
                                  subTextColor,
                                  TextAlign.center,
                                  FontWeight.w600,
                                  getPercentSize(progressHeight, 8))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: getScreenPercentSize(context, 4),
              ),
              getTextWidget(
                  "Membuat\nrencana diet",
                  textColor,
                  TextAlign.center,
                  FontWeight.bold,
                  getScreenPercentSize(context, 3))
            ],
          ),
        ),
      ),
    );
  }
}
