import 'dart:ui';
import 'package:aesthenics/utils/Constants.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  static Function fontCoveredByYourGrace = (
      {Color color, @required double size}) =>
      _coveredByYourGraceFont(color, size);

  static TextStyle _coveredByYourGraceFont(
      Color color, double size) {
    return _textStyle(Constants.coveredByYourGrace, color, size);
  }

  static Function fontMistral = (
          {Color color, @required double size}) =>
      _ultraLightFont(color, size);

  static TextStyle _ultraLightFont(
      Color color, double size) {
    return _textStyle(Constants.mistral, color, size);
  }

  static TextStyle _textStyle(
      String fontFamily, Color color, double size) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
    );
  }

  static Function fontRobotoRegular = (
      {Color color, @required double size}) =>
      _robotoRegular(color, size);

  static Function fontRobotoBold = (
      {Color color, @required double size}) =>
      _robotoBold(color, size);

  static TextStyle _robotoRegular(
      Color color, double size) {
    return _textStyleRobotoRegular(Constants.roboto, color, size);
  }
  static TextStyle _robotoBold(
      Color color, double size) {
    return _textStyleRobotoBold(Constants.roboto, color, size);
  }

  static TextStyle _textStyleRobotoRegular(
      String fontFamily, Color color, double size) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400
    );
  }

  static TextStyle _textStyleRobotoBold(
      String fontFamily, Color color, double size) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700
    );
  }
  static Function fontRobotoThin = (
      {Color color, @required double size}) =>
      _robotoThin(color, size);

  static TextStyle _robotoThin(
      Color color, double size) {
    return _textStyleRobotoThin(Constants.roboto, color, size);
  }

  static TextStyle _textStyleRobotoThin(
      String fontFamily, Color color, double size) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w100
    );
  }

  static Function fontRobotoItalic = (
      {Color color, @required double size}) =>
      _robotoItalic(color, size);

  static TextStyle _robotoItalic(
      Color color, double size) {
    return _textStyleRobotoItalic(Constants.roboto, color, size);
  }

  static TextStyle _textStyleRobotoItalic(
      String fontFamily, Color color, double size) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w100
    );
  }

}
