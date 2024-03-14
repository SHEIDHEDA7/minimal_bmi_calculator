// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers, unused_import

import 'package:bmi_calculator/bmi_functionality.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/genderCard.dart';
import 'package:bmi_calculator/pages/home_page.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiValue;
  final String resultText;
  final String interpretation;
  const ResultsPage({
    super.key,
    required this.bmiValue,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        title: Text(
          "B M I    C A L C U L A T O R",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Result",
                style: kHeightStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Actual Result
          Expanded(
            flex: 5,
            child: MyCard(
              cardColor: kInactiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiValue,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),

          // Re-Calculate
          BottomButton(
            buttonName: "RE-CALCULATE BMI",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
