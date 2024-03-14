import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;

  BmiCalculator({required this.height, required this.weight});

  late double bmi;

  String calculateBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpretation() {
    if (bmi >= 25) {
      return 'You need to Exercise more';
    } else if (bmi >= 18.5) {
      return 'Continue what you are doing';
    } else {
      return 'You need to Eat mores';
    }
  }
}
