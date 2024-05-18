import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naukrified/base_features/Resume/experience_form.dart';
import 'package:naukrified/base_features/firebase/personal_details.dart';
import 'package:naukrified/base_features/models/resume_data.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/providers/image.dart';
import 'package:naukrified/base_features/widgets/profile_image.dart';
import 'package:naukrified/base_features/widgets/settings/current_user_tile.dart';

class ResumeForm extends ConsumerStatefulWidget {
  @override
  _ResumeFormState createState() => _ResumeFormState();
}

class _ResumeFormState extends ConsumerState<ResumeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Form'),
      ),
      body: FutureBuilder(
        future: getPersonalDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return DetailsForm(data: snapshot.data);
        },
      ),
    );
  }
}

class DetailsForm extends ConsumerStatefulWidget {
  DetailsForm({Key? key, required this.data}) : super(key: key);
  final TemplateData? data;

  @override
  ConsumerState<DetailsForm> createState() => DetailsFormState();
}

class DetailsFormState extends ConsumerState<DetailsForm> {
  late TextEditingController fullNameController;
  late TextEditingController currentPositionController;
  late TextEditingController streetController;
  late TextEditingController addressController;
  late TextEditingController countryController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController(text: widget.data?.fullName);
    currentPositionController =
        TextEditingController(text: widget.data?.currentPosition ?? "");
    streetController = TextEditingController(text: widget.data?.street ?? "");
    addressController = TextEditingController(text: widget.data?.address ?? "");
    countryController = TextEditingController(text: widget.data?.country ?? "");
    emailController = TextEditingController(text: widget.data?.email ?? "");
    phoneNumberController =
        TextEditingController(text: widget.data?.phoneNumber ?? "");
    bioController = TextEditingController(text: widget.data?.bio ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final templateData = ref.watch(templateDataProvider);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('Personal Details'),
                _buildTextFormField('Full Name', fullNameController),
                _buildTextFormField(
                    'Current Position', currentPositionController),
                SizedBox(height: 16.0),
                _buildSectionTitle('Address'),
                _buildTextFormField('Street', streetController),
                _buildTextFormField('Address', addressController),
                _buildTextFormField('Country', countryController),
                SizedBox(height: 16.0),
                _buildSectionTitle('Contact Information'),
                _buildTextFormField('Email', emailController),
                _buildTextFormField('Phone Number', phoneNumberController),
                SizedBox(height: 16.0),
                _buildSectionTitle('Bio'),
                TextFormField(
                  controller: bioController,
                  decoration: InputDecoration(labelText: 'Bio'),
                  maxLines: null,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // currentUser.imgUrl = _profileImage != null
                    //     ? await uploadImage(context, _profileImage,
                    //         currentUser.email!, "profile-image.jpg")
                    //     : currentUser.imgUrl;

                    final tempData = TemplateData(
                      fullName: fullNameController.text,
                      currentPosition: currentPositionController.text,
                      street: streetController.text,
                      address: addressController.text,
                      country: countryController.text,
                      email: emailController.text,
                      phoneNumber: phoneNumberController.text,
                      bio: bioController.text,
                      image: currentUser.imgUrl,
                      // backgroundImage: coverImageUrl,
                    );
                    ref
                        .read(templateDataProvider.notifier)
                        .updateData(tempData);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExperienceForm(data: widget.data),
                      ),
                    );
                  },
                  child: Text('Next'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    fullNameController.clear();
                    currentPositionController.clear();
                    streetController.clear();
                    addressController.clear();
                    countryController.clear();
                    emailController.clear();
                    phoneNumberController.clear();
                    bioController.clear();
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildTextFormField(String label, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(labelText: label),
  );
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
