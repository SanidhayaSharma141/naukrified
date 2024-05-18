import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/forgot_password.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/login_screen.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/register_screen.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/reset_password.dart';
import 'package:naukrified/base_features/features/full_page_job.dart';
import 'package:naukrified/base_features/features/home/home_screen.dart';
import 'package:naukrified/base_features/features/main_screen.dart';
import 'package:naukrified/base_features/features/applied_jobs_screen.dart';
import 'package:naukrified/base_features/utils/splash_screen.dart';
import 'package:naukrified/base_features/utils/success_screen.dart';

class GetAppRoutes {
  GetAppRoutes._();

  static List<GetPage<dynamic>> getAppRoutes() {
    return [
      GetPage(
        name: NamedRoutes.homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: NamedRoutes.logIn,
        page: () => const LogIn(),
      ),
      GetPage(
        name: NamedRoutes.registerScreen,
        page: () => const RegisterScreen(),
      ),
      GetPage(
        name: NamedRoutes.splashScreen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: NamedRoutes.forgotPassword,
        page: () => const ForgotPassword(),
      ),
      GetPage(
        name: NamedRoutes.resetPassword,
        page: () => ResetPassword(),
      ),
      GetPage(
        name: NamedRoutes.successScreen,
        page: () => const SuccessScreen(),
      ),
      GetPage(
        name: NamedRoutes.mainScreen,
        page: () => const MainScreen(),
      ),
    ];
  }
}
