import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/tools.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return ElevatedButton.icon(
      label: const Text('Sign Out'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.red,
      ),
      onPressed: () async {
        if (await askUser(context, 'Do you really wish to sign out?',
                yes: true, no: true) !=
            'yes') return;
        if (context.mounted) {
          while (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        }
        auth.signOut();
      },
      icon: const Icon(Icons.logout_rounded),
    );
  }
}
