import 'package:flutter/material.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/forgot_password.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/login_screen.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/register_screen.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/reset_password.dart';
import 'package:naukrified/base_features/features/home/home_screen.dart';
import 'package:naukrified/base_features/utils/splash_screen.dart';
import 'package:naukrified/base_features/utils/success_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> routes() {
    return {
      NamedRoutes.splashScreen: (context) => const SplashScreen(),
      NamedRoutes.logIn: (context) => const LogIn(),
      NamedRoutes.registerScreen: (context) => const RegisterScreen(),
      NamedRoutes.forgotPassword: (context) => const ForgotPassword(),
      NamedRoutes.successScreen: (context) => const SuccessScreen(),
      NamedRoutes.resetPassword: (context) => ResetPassword(),
      NamedRoutes.homeScreen: (context) => const HomeScreen(),
    };
  }
}
