import 'dart:math';

class BMICalculator {
  BMICalculator({this.height, this.weight});
  final int height;
  final int weight;

  double _bmiIndex;

  String calculateBMI() {
    _bmiIndex = weight / pow(height / 100, 2);
    return _bmiIndex.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiIndex < 19) {
      return "Under Weight";
    } else if (_bmiIndex >= 19 && _bmiIndex <= 24) {
      return "Normal";
    } else if (_bmiIndex >= 25 && _bmiIndex <= 29) {
      return "Over Weight";
    } else if (_bmiIndex >= 30 && _bmiIndex <= 39) {
      return "Obese";
    } else {
      return "Extremely Over Weight";
    }
  }

  String getInterpretation() {
    if (_bmiIndex < 19) {
      return "Your BMI is very less. Please take care of yourself and eat healthy food";
    } else if (_bmiIndex >= 19 && _bmiIndex <= 24) {
      return "Hurray!!! You are Healthy. Please take care of yourself";
    } else if (_bmiIndex >= 25 && _bmiIndex <= 29) {
      return "Your BMI is slightly higher than normal. Please take care of yourself and maintain a healthy lifestyle";
    } else if (_bmiIndex >= 30 && _bmiIndex <= 39) {
      return "Your BMI is high. Please take care of yourself and maintain a healthy lifestyle";
    } else {
      return "Please take care of yourself";
    }
  }
}
