import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final IconData? genderIcon;
  final String gender;

  const ReusableCard({
    super.key,
    required this.gender,
    this.genderIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          gender,
          style: kLabelStyle,
        )
      ],
    );
  }
}
