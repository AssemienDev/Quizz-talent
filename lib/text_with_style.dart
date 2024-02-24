import 'package:flutter/material.dart';

class TextWithStyle extends Text {
  TextWithStyle({required String data,
    double size = 18,
    weight =  FontWeight.normal,
    style = FontStyle.normal,
    Color color = Colors.black}):super(
      data,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
      )
  );
}