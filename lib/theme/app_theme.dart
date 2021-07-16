import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: kDefaultTextColor,
  accentColor: kAccentColor,
  splashColor: kLightestGrey,
  highlightColor: kLightGrey,
  scaffoldBackgroundColor: kBaseColor,
  textTheme: _textTheme,
  iconTheme: IconThemeData(
    color: kDefaultTextColor,
  ),
);

final _textTheme = GoogleFonts.kanitTextTheme(TextTheme(
  headline1: TextStyle(
      fontSize: 34, fontWeight: FontWeight.bold, color: kDefaultTextColor),
  headline2: TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: kDefaultTextColor),
  headline3: TextStyle(
      fontSize: 24, fontWeight: FontWeight.normal, color: kDefaultTextColor),
  bodyText1: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ),
));

final neumorphicTheme = NeumorphicThemeData(
    defaultTextColor: Color(0xFF30475E),
    accentColor: Color(0xFFF05454),
    variantColor: Color(0xFFFFA45B),
    baseColor: Color(0xFFE8E8E8),
    depth: 10,
    intensity: 0.6,
    lightSource: LightSource.topLeft);
