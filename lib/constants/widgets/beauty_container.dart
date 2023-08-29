import 'package:flutter/material.dart';

Widget beautyContainer(double? height,
    {required Widget child,
    required double width,
    Color? backgroundColor = Colors.white,
    bool shadowless = false,
    bool allCircular = true,
    double boxShadowValue = 0.2,
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0}) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: allCircular
            ? BorderRadius.circular(20)
            : BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                topRight: Radius.circular(topRight),
                bottomLeft: Radius.circular(bottomLeft),
                bottomRight: Radius.circular(bottomRight)),
      ),
      child: child);
}
