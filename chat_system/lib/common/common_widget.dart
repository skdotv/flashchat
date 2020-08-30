import 'package:flutter/material.dart';

Widget button(
    {String label,
    Color color,
    Function onPressed,
    double verticalPadding = 16.0}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: verticalPadding),
    child: Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: onPressed,
        minWidth: 250,
      ),
    ),
  );
}
