import 'dart:io';

import 'package:flutter/material.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/providers/image.dart';
import 'package:naukrified/tools.dart';
import 'package:naukrified/base_features/widgets/other/loading_elevated_button.dart';
import 'package:naukrified/base_features/widgets/profile_image.dart';
import 'package:naukrified/base_features/widgets/settings/section.dart';

class EditProfileWidget extends StatefulWidget {
  EditProfileWidget({super.key, UserData? user}) {
    this.user = user ?? UserData();
  }

  late UserData user;
  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  final _formKey = GlobalKey<FormState>();

  File? img;

  Future<void> save(context) async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    widget.user.imgUrl = img != null
        ? await uploadImage(
            context, img, widget.user.email!, "profile-image.jpg")
        : widget.user.imgUrl;
    widget.user.name = widget.user.name == null
        ? null
        : widget.user.name!.trim().toPascalCase();
    await updateUserData(widget.user);
    Navigator.of(context).pop(true); // to show that a change was done
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Hero(
                tag: 'profile-image',
                child: ProfileImage(
                  url: widget.user.imgUrl,
                  onChanged: (value) {
                    img = value;
                  },
                ),
              ),
              Text(
                widget.user.email ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const Divider(),
              Section(title: 'Personal Information', children: [
                if (widget.user.email == null)
                  TextFormField(
                    maxLength: 50,
                    keyboardType: TextInputType.emailAddress,
                    enabled: widget.user.email == null,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                    ),
                    initialValue: widget.user.name,
                    validator: (email) {
                      return Validate.email(email);
                    },
                    onSaved: (email) {
                      widget.user.email = email!.trim();
                    },
                  ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                  initialValue: widget.user.name,
                  validator: (name) {
                    return Validate.name(name);
                  },
                  onSaved: (value) {
                    widget.user.name = value!.trim();
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    label: Text("Phone Number"),
                  ),
                  initialValue: widget.user.phoneNumber,
                  validator: (name) {
                    return Validate.phone(name, required: false);
                  },
                  onSaved: (value) {
                    widget.user.phoneNumber = value!.trim();
                  },
                ),
                TextFormField(
                  maxLength: 200,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    label: Text("Address"),
                  ),
                  initialValue: widget.user.address,
                  validator: (name) {
                    return Validate.text(name, required: false);
                  },
                  onSaved: (value) {
                    widget.user.address = value!.trim();
                  },
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoadingElevatedButton(
                    onPressed: () async {
                      await save(context);
                    },
                    icon: Icon(
                      widget.user.email == null
                          ? Icons.person_add_rounded
                          : Icons.save_rounded,
                    ),
                    label: Text(widget.user.email == null ? 'Add' : 'Save'),
                  ),
                  TextButton.icon(
                    onPressed: () => _formKey.currentState!.reset,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
