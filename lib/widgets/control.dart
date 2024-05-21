import 'package:bmi/constants.dart';
import 'package:bmi/widgets/result.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  final bool isMale;

  const Control({super.key, required this.isMale});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int weight = 25;
  int height = 120;

  @override
  Widget build(BuildContext context) {
    Color kMainColor = widget.isMale ? kBlue : kRed;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: kMainColor,
                                size: 35,
                              ),
                            ),
                            Text(
                              'BMI Buddy',
                              style: TextStyle(
                                fontSize: 35,
                                color: kMainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.isMale ? 'Male' : 'Female',
                              style: const TextStyle(
                                  fontSize: 26, color: Colors.black),
                            ),
                            Icon(
                              widget.isMale ? Icons.male : Icons.female,
                              color: kMainColor,
                              size: 120,
                            ),
                            const Text(
                              'Weight (KG)',
                              style: TextStyle(fontSize: 26),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 36,
                          itemBuilder: (context, index) {
                            int i = (index + 5) * 5;
                            return Padding(
                              padding: const EdgeInsets.all(18),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    weight = i;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    "$i",
                                    style: TextStyle(
                                      fontSize: weight == i ? 42 : 24,
                                      color: weight == i
                                          ? kMainColor
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(color: kMainColor),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'Height \n (CM)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 36,
                            itemBuilder: (context, index) {
                              int i = (index + 25) * 5;
                              return Padding(
                                padding: const EdgeInsets.all(18),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      height = i;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: height == i
                                          ? Colors.white
                                          : kMainColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "$i",
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: height == i
                                              ? kMainColor
                                              : Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: MediaQuery.sizeOf(context).width - 225,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultScreen(
                          height: height,
                          weight: weight,
                          isMale: widget.isMale,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFFbbd4ce),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Calculate'.toUpperCase(),
                      style: TextStyle(color: kYellow),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: kYellow,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
