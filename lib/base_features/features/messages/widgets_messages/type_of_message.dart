import 'package:flutter/widgets.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';

class TypeOfMessage extends StatelessWidget {
  const TypeOfMessage(this.typeMsg, {super.key});

  final String typeMsg;
  @override
  Widget build(BuildContext context) {
    return Text(
      typeMsg,
      style: const TextStyle(
        color: ColorStyles.darkTitleColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
