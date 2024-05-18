import 'package:flutter/widgets.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';

class ValidationError extends StatelessWidget {
  const ValidationError({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(value: 4, ctx: context),
        Text(
          errorText,
          style: const TextStyle(color: ColorStyles.failureColor),
        ),
      ],
    );
  }
}
