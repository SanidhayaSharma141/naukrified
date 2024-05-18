import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  const UserTile({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodySmall!;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sanidhaya",
              style: style,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              visualDensity: VisualDensity.compact,
              onPressed: () => {},
              icon: const Icon(
                Icons.close_rounded,
              ),
            )
          ],
        ),
      ),
    );
  }
}
