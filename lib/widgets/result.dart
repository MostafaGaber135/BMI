import 'dart:math';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int height;
  final int weight;
  final bool isMale;

  const ResultScreen({
    super.key,
    required this.height,
    required this.weight,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    double bmiCalculate = weight / pow(height / 100, 2);
    String result = '';
    if (bmiCalculate < 16) {
      result = 'Severe Thinness';
    } else if (bmiCalculate >= 16 && bmiCalculate < 18.5) {
      result = 'Underweight';
    } else if (bmiCalculate >= 18.5 && bmiCalculate < 25) {
      result = 'Normal';
    } else if (bmiCalculate >= 25 && bmiCalculate < 30) {
      result = 'Overweight';
    } else if (bmiCalculate >= 30) {
      result = 'Obese';
    }

    return Scaffold(
      backgroundColor: isMale ? kBlue : kRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'Your BMI is : ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  bmiCalculate.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  result,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 42,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
