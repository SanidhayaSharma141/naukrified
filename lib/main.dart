import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/app_translation.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:naukrified/base_features/constants/get_app_routes.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  try {
    if (auth.currentUser != null) {
      currentUser = await fetchUserData(auth.currentUser!.email!);
    } else {}
  } catch (e) {}
  runApp(const ProviderScope(child: MyApp()));
}

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;
final firebaseMessaging = FirebaseMessaging.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StaticText.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorStyles.defaultMainColor,
        fontFamily: FontStyles.fontFamily,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: ColorStyles.darkTitleColor,
          ),
        ),
      ),
      initialRoute: NamedRoutes.splashScreen,
      getPages: GetAppRoutes.getAppRoutes(),
      locale: Get.deviceLocale,
      translationsKeys: AppTranslation.translationKeys,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
