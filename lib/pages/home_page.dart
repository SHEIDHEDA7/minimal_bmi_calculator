// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'dart:ffi';
import 'package:bmi_calculator/bmi_functionality.dart';
import 'package:bmi_calculator/components/card.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/components/genderCard.dart';
import 'package:bmi_calculator/pages/results_page.dart';
// import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Genders {
  none,
  male,
  female,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Genders selectedGender = Genders.none;
  int height = 140;
  int weight = 50;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "B M I    C A L C U L A T O R",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          // backgroundColor: Color(0xFF0A0E21),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              // 1st Row
              child: Row(
                children: [
                  // Male card
                  Expanded(
                    child: MyCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Genders.male;
                        });
                      },
                      cardColor: selectedGender == Genders.male
                          ? kActiveCard
                          : kInactiveCard,
                      cardChild: ReusableCard(
                        gender: "M A L E",
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),

                  // Female card
                  Expanded(
                    child: MyCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Genders.female;
                        });
                      },
                      cardColor: selectedGender == Genders.female
                          ? kActiveCard
                          : kInactiveCard,
                      cardChild: ReusableCard(
                        gender: "F E M A L E",
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Height slider/adjuster
            Expanded(
              child: MyCard(
                onPressed: () {},
                cardColor: kInactiveCard,
                cardChild: Column(
                  children: [
                    Text(
                      "H E I G H T",
                      style: kLabelStyle,
                    ),
                    // Height in cm
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kHeightStyle,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "C M ",
                          style: kLabelStyle,
                        )
                      ],
                    ),
                    // Slider
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbColor: Colors.amber[700],
                          activeTrackColor: kColorOfCalculator,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayColor: kColorOfCalculator,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 230,
                          onChanged: (double newVal) {
                            setState(() {
                              height = newVal.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),

            // Age & Weight
            Expanded(
              child: Row(
                children: [
                  // Age
                  Expanded(
                      child: MyCard(
                          cardColor: kInactiveCard,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "A G E",
                                style: kLabelStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kHeightStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    iconD: FontAwesomeIcons.minus,
                                    onTap: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    iconD: FontAwesomeIcons.plus,
                                    onTap: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          onPressed: () {})),

                  // Weight
                  Expanded(
                      child: MyCard(
                          cardColor: kInactiveCard,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "W E I G H T",
                                style: kLabelStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kHeightStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    iconD: FontAwesomeIcons.minus,
                                    onTap: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  RoundIconButton(
                                    iconD: FontAwesomeIcons.plus,
                                    onTap: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                          onPressed: () {})),
                ],
              ),
            ),

            // calculate card
            BottomButton(
                buttonName: "CALCULATE BMI",
                onPress: () {
                  BmiCalculator bc =
                      BmiCalculator(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiValue: bc.calculateBmi(),
                        resultText: bc.getResult(),
                        interpretation: bc.interpretation(),
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}
