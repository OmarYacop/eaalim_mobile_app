import 'package:flutter/material.dart';

Widget textBox(height, width, String text,
    {FontWeight fontWeight = FontWeight.normal,
    double fontSize = 15,
    Color? color,
    TextOverflow textOverflow = TextOverflow.ellipsis,
    int? maxLines = 2,
    Alignment alignment = Alignment.topLeft,
    FontStyle fontStyle = FontStyle.normal}) {
  return Align(
    alignment: alignment,
    child: width == null && height == null
        ? maxLines != null
            ? Text(
                text,
                overflow: textOverflow,
                maxLines: maxLines,
                style: TextStyle(
                    color: color,
                    fontWeight: fontWeight,
                    fontSize: fontSize,
                    fontStyle: fontStyle),
              )
            : Text(
                text,
                style: TextStyle(
                  color: color,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                ),
              )
        : SizedBox(
            height: height,
            width: width,
            child: maxLines != null
                ? Text(
                    text,
                    overflow: textOverflow,
                    maxLines: maxLines,
                    style: TextStyle(
                      color: color,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                    ),
                  ),
          ),
  );
}
