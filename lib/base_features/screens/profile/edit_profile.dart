import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/widgets/profile/edit_profile.dart';
import 'package:naukrified/base_features/widgets/settings/sign_out_button.dart';

class EditProfile extends ConsumerWidget {
  late final UserData user;

  EditProfile({super.key, UserData? user}) {
    this.user = user ?? UserData();
  }

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [if (user.email == currentUser.email) const SignOutButton()],
      ),
      body: EditProfileWidget(
        user: user,
      ),
    );
  }
}
