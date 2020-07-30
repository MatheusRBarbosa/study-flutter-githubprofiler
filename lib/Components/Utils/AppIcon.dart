import 'package:flutter/material.dart';

class AppIcon {
  static const Icon _STAR = Icon(Icons.star);
  static const Icon _ISSUES = Icon(Icons.announcement);
  static const Icon _FORKS = Icon(Icons.device_hub);

  static Icon getIconById(String name) {
    if (name == "star") {
      return _STAR;
    } else if (name == "issues") {
      return _ISSUES;
    } else if (name == "forks") {
      return _FORKS;
    } else {
      return null;
    }
  }
}
