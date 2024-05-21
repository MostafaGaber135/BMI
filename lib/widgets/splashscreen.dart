import 'dart:async';
import 'package:bmi/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushNamed(context, HomePage.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF024959),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/weight.png',
              height: 350,
              width: 350,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'BMI Buddy',
            style: TextStyle(
              fontSize: 45,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Lottie.asset(
              'assets/Lottieflow/lottieflow-loading-03-ffffff-easey.json',
            ),
          ),
        ],
      ),
    );
  }
}
