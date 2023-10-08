import 'package:flutter/material.dart';

class BarItem {
  /// Selected or active icon must be filled icon and complementary to inactive icon.
  final Image filledIcon;

  /// Normal or inactive icon must be outlined icon and complementary to active icon.
  final Image outlinedIcon;
  bool topIcon = false;
  BarItem({
    required this.filledIcon,
    required this.outlinedIcon,
    required this.topIcon,
  });
}
