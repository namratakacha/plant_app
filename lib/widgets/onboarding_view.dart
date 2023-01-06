import 'package:flutter/material.dart';

import '../constants/colors_titles.dart';

class OnBoardingViewPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnBoardingViewPage({Key? key, required this.image, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 36,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          description,
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
