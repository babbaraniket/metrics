import 'package:flutter/material.dart';

/* Function: metricsAppBar build the app bar of the app.
*  Parameter: title(The title of the AppBar)
*  Return: reusable AppBar widget to be drawn on the screen. */
AppBar metricsAppBar(title) {
  return AppBar(
    backgroundColor: const Color(0xff53a99a),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 24.0,
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
