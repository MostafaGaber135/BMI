import 'package:bmi/constants.dart';
import 'package:bmi/widgets/control.dart';
import 'package:bmi/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            GenderCard(
              gender: 'Male',
              genderColor: kBlue,
              genderIcon: Icons.male,
              isMale: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Control(isMale: true),
                    ));
              },
            ),
            GenderCard(
              gender: 'Female',
              genderColor: kRed,
              genderIcon: Icons.female,
              isMale: false,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Control(isMale: false),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
