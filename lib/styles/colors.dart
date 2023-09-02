import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

const primaryColor = Color(0xFF305BAA);
Color primaryDarkColor = TinyColor.fromColor(primaryColor).darken(10).color;
Color primaryLightColor = TinyColor.fromColor(primaryColor).lighten(40).color;
Color backgroundColor = TinyColor.fromColor(primaryColor).lighten(52).color;
const whiteColor = Colors.white;
Color positiveBalanceColor = Colors.green;
const titleFontSize = 30.0;
const fieldSpace = 0.0;
