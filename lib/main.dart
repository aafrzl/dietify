import 'package:diet_planner_app/models/api_calls.dart';
import 'package:diet_planner_app/models/daily_plans_models.dart';
import 'package:diet_planner_app/models/google_auth.dart';
import 'package:diet_planner_app/screens/bmr_page.dart';
import 'package:diet_planner_app/screens/home_screen.dart';
import 'package:diet_planner_app/screens/intro_page.dart';
import 'package:diet_planner_app/screens/login_screen.dart';
import 'package:diet_planner_app/utils/colors.dart';
import 'package:diet_planner_app/utils/pref_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

int? isFirstPage;
double? calorie;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: statusBar,
      systemNavigationBarColor: statusBar,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  //initializing SharePreferense and getting data
  await PrefData.init();
  isFirstPage = PrefData.getIsFirstTime() ?? 0;

  // jika user sudah input data akan diarahkan ke halaman home
  calorie = PrefData.getCalorie() ?? 0;
  DailyPlans? dailyPlans = await ApiService.instance.generateMealsPlans(
    targetCalories: calorie!.round(),
  );

  //user spesifik screen
  getClass() {
    if (isFirstPage == 0) {
      return const IntroPage();
    } else if (isFirstPage == 1) {
      return const LoginHomePage();
    } else if (isFirstPage == 2) {
      return BmrPage();
    } else if (isFirstPage == 3) {
      return HomeScreen(
        dailyPlans: dailyPlans,
      );
    }
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => GoogleLoginClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: getClass(),
        theme: ThemeData(colorSchemeSeed: statusBar),
      ),
    ),
  );
}
