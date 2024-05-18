import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.welcomeText,
  });

  final String welcomeText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              welcomeText,
              style: TextStyle(
                fontFamily: FontStyles.fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: scaleWidth(15, context),
                color: ColorStyles.darkTitleColor,
              ),
            ),
          ],
        ),
        const Text(
          StaticText.applyToJobs,
          style: FontStyles.lightStyle,
        ),
      ],
    );
  }
}
