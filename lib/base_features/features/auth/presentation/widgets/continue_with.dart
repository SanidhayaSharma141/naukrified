import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/features/auth/data/services/firebase/auth_service.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/features/widgets/failure_snack_bar.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';

class ContinueWithOtherAccounts extends StatelessWidget {
  const ContinueWithOtherAccounts({super.key, required this.isLogin});

  // To check if it is for the login page or register page
  // On basis of this, we direct user to different pages
  final bool isLogin;

  // When user sign in with google
  Future<void> onTapSignInWithGoogle(BuildContext context) async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // It creates continue with text with dividers
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Color(
                  0xFFAFB0B6,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: scaleHeight(8, context)),
              child: const Text(
                'Or continue with',
                style: TextStyle(
                  color: Color(0xFFAFB0B6),
                ),
              ),
            ),
            const Expanded(
              child: Divider(
                color: Color(
                  0xFFAFB0B6,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: scaleHeight(40, context),
        ),

        // ACCOUNT ICONS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                // Nothing
              },
              child: SvgPicture.asset(
                Assets.appleSvg,
              ),
            ),
            InkWell(
              onTap: () => onTapSignInWithGoogle(context),
              child: SvgPicture.asset(
                Assets.googleSvg,
              ),
            ),
            InkWell(
              onTap: () async {},
              child: SvgPicture.asset(
                Assets.facebookSvg,
              ),
            ),

            // SvgPicture.asset(Assets.facebookSvg),
          ],
        ),

        SizedBox(
          height: scaleHeight(32, context),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogin ? "Haven't an account?" : "Have an account?",
              style: TextStyle(
                color: const Color(0xFFBDBEC2),
                fontSize: scaleHeight(16, context),
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () {
                isLogin
                    ? Navigator.pushNamed(
                        context,
                        NamedRoutes.registerScreen,
                      )
                    : Navigator.pop(context);
              },
              child: Text(
                isLogin ? 'Register' : 'Log in',
                style: TextStyle(
                  fontSize: scaleHeight(14, context),
                  fontFamily: FontStyles.fontFamily,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),

        SizedBox(
          height: scaleHeight(8, context),
        ),
      ],
    );
  }
}
