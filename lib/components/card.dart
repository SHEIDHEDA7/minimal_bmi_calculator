// import 'package:bmi_calculator/home_page.dart';
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  VoidCallback? onPressed;

  MyCard({
    super.key,
    required this.cardColor,
    required this.cardChild,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: cardColor),
        child: cardChild,
        // height: 200,
        // width: 170,
      ),
    );
  }
}
