import 'package:diet_planner_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var titleApp = GoogleFonts.poppins(
  fontSize: 36,
  fontWeight: FontWeight.w900,
  color: statusBar,
);

const welcomeText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(181, 29, 31, 31),
);

const subWelcomeText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  color: Color.fromARGB(181, 29, 31, 31),
);

const hintText = TextStyle(
  fontSize: 15,
  color: Colors.black54,
);

const inputText = TextStyle(fontSize: 18);

const loginText =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

const signUp = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

const onboardtextStyle = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.w300,
  color: Colors.black,
);

const onboardSubtextStyle = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w300,
  color: onBoardingSubTextColor,
);

const skipStyle = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: onBoardingSubTextColor);

const buttonStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);

var dateAndTime = GoogleFonts.roboto(
  fontSize: 17,
  fontWeight: FontWeight.w500,
  color: const Color(0xB31E1E1E),
);

var mealTitle = GoogleFonts.roboto(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: const Color(0xB31E1E1E),
);

var mealSub = GoogleFonts.roboto(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: const Color(0xB31E1E1E),
);

var gaugeLabel = GoogleFonts.roboto(
  fontSize: 58,
  fontWeight: FontWeight.normal,
  color: Colors.white.withOpacity(0.5),
);

var theThreeLabels = GoogleFonts.roboto(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: Colors.white.withOpacity(0.9),
);
