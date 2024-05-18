import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/features/widgets/custom_progress_indicator.dart';
import 'package:naukrified/base_features/features/auth/presentation/widgets/login_button.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';
import 'package:country_picker/country_picker.dart';
import 'package:naukrified/base_features/features/auth/presentation/widgets/text_fields.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/features/auth/data/controllers/validation.dart';
import '../../data/controllers/auth_functions.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isMobile = false;
  bool isEmail = true;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Country _country = Country(
    phoneCode: '91',
    countryCode: '91',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '',
  );

  // final TextEditingController emailController;
  final TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: Text('Todo')),
      ),
    );
  }
}
