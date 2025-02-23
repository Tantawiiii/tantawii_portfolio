import 'package:flutter/material.dart';

Widget buildHelloText(){
  return  Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: "Hello! I am ",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextSpan(
          text: "Ahmed Tantawii",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent,
          ),
        ),
      ],
    ),
  );
}