import 'package:flutter/material.dart';

class Styles {
  static BoxDecoration gradiantStyle = BoxDecoration(
    boxShadow: [
      const BoxShadow(
        color: Colors.pink,
        blurRadius: 5,
        spreadRadius: 1,
        offset: Offset(0, 0),
      ),
      BoxShadow(
        color: Colors.blue[500]!,
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ],
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    gradient: const LinearGradient(
      colors: [
        Colors.pink,
        Colors.blue,
      ],
    ),
  );
}
