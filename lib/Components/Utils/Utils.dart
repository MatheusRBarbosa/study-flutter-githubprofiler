import 'package:flutter/material.dart';
import 'AppIcon.dart';

class Utils {
  static info(String label, int number) {
    return Column(
      children: <Widget>[titleFormatting(label), Text(number.toString())],
    );
  }

  static infoIcon(String icon, int number) {
    return Column(
      children: <Widget>[AppIcon.getIconById(icon), Text(number.toString())],
    );
  }

  static titleFormatting(String name, [double fontSize]) {
    if (fontSize == null) {
      fontSize = 16.0;
    }
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }
}
