import 'package:flutter/material.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/features/auth/data/controllers/auth_functions.dart';
import 'package:naukrified/base_features/features/auth/presentation/widgets/login_button.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';
import 'package:naukrified/base_features/constants/strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(32, context),
            vertical: scaleHeight(42, context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                StaticText.success,
                style: FontStyles.boldStyle,
              ),
              VerticalSpace(
                value: 48,
                ctx: context,
              ),
              LoginButton(
                loginText: 'Sign out',
                onTapButton: () => AuthFunctions.signOutUser(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
