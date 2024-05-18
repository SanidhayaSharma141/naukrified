import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';

import '../constants/route_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        AppRoute.offNamed(NamedRoutes.logIn);
      } else {
        AppRoute.offNamed(NamedRoutes.mainScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Container(
          width: width(context),
          height: height(context),
          decoration: const BoxDecoration(color: Colors.white30),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(
                80,
                context,
              ),
              vertical: scaleHeight(
                88,
                context,
              ),
            ),
            child: Center(child: Image.asset('assets/images/logo.png')),
          ),
        ),
      ),
    );
  }
}
