import 'package:bmi_calculator/constants/constants.dart';
// import 'package:bmi_calculator/home_page.dart';
// import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;

  const BottomButton({
    super.key,
    required this.onPress,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kColorOfCalculator,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kHeightOfCalculator,
        padding: const EdgeInsets.only(bottom: 15),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
