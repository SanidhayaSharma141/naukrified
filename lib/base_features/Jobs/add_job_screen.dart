import 'dart:io';

import 'package:flutter/material.dart';
import 'package:naukrified/base_features/atom/pill.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/providers/image.dart';
import 'package:naukrified/tools.dart';
import 'package:naukrified/base_features/widgets/other/loading_elevated_button.dart';
import 'package:naukrified/base_features/widgets/profile_image.dart';
import 'package:naukrified/base_features/widgets/settings/section.dart';
import 'package:uuid/uuid.dart';

class AddJobScreen extends StatefulWidget {
  AddJobScreen({Key? key, JobModel? job}) : super(key: key) {
    this.job = job ?? JobModel.empty();
    if (this.job!.id == null) this.job!.id = Uuid().v4();
  }

  JobModel? job;
  @override
  State<AddJobScreen> createState() => _AddJobScreenState();
}

class _AddJobScreenState extends State<AddJobScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> skills = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.job == null) {
      widget.job = JobModel.empty();
      widget.job!.companyName =
          currentUser.accountType == "Company" ? currentUser.name : "";
    } else {
      benefits = List.from(widget.job!.benefits ?? []);
      widget.job!.companyName =
          currentUser.accountType == "Company" ? currentUser.name : "";
      responsibilities = List.from(widget.job!.responsibilities ?? []);
      qualifications = List.from(widget.job!.qualifications ?? []);
      extensions = List.from(widget.job!.extensions ?? []);
      remote = widget.job!.isRemote ?? false;
    }
    // print(widget.job!.id);
  }

  File? img;

  List<String> benefits = [];
  List<String> responsibilities = [];
  List<String> qualifications = [];
  List<String> extensions = [];

  bool remote = false;

  Future<void> save(context) async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    {
      widget.job!.thumbnail = img != null
          ? await uploadImage(context, img, widget.job!.id!, "thumbnail.jpg")
          : widget.job!.url;
      widget.job!.title = widget.job!.title?.trim().toString().toPascalCase();
      widget.job!.benefits = benefits;
      widget.job!.responsibilities = responsibilities;
      widget.job!.qualifications = qualifications;
      widget.job!.extensions = extensions;
      widget.job!.isRemote = remote;
      widget.job!.skills = skills;
    }
    await addJob(widget.job!);
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'thumbnail',
                child: ProfileImage(
                  url: widget.job!.url,
                  onChanged: (value) {
                    img = value;
                  },
                ),
              ),
              const Divider(),
              Section(title: 'About The Job', children: [
                TextFormField(
                  maxLength: 50,
                  enabled: !(currentUser.accountType == "Company"),
                  decoration: const InputDecoration(
                    label: Text("Company Name"),
                  ),
                  onChanged: (value) {
                    widget.job!.companyName = value;
                  },
                  initialValue: currentUser.accountType == "Company"
                      ? currentUser.name
                      : widget.job!.companyName,
                ),
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  initialValue: widget.job!.title,
                  validator: (title) {
                    return Validate.name(title);
                  },
                  onSaved: (value) {
                    widget.job!.title = value!.trim();
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                  ),
                  initialValue: widget.job!.description,
                  validator: (text) {
                    return Validate.text(text, required: false);
                  },
                  onSaved: (value) {
                    widget.job!.description = value!.trim();
                  },
                ),
                TextFormField(
                  maxLength: 200,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    label: Text("Location"),
                  ),
                  initialValue: widget.job!.location,
                  validator: (title) {
                    return Validate.name(title, required: false);
                  },
                  onSaved: (value) {
                    widget.job!.location = value!.trim();
                  },
                ),
                TextFormField(
                  maxLength: 200,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Salary(in INR)"),
                  ),
                  initialValue: widget.job!.salary,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Salary is required";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    widget.job!.salary = value!.trim();
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Skills',
                    hintText: 'Enter a skill',
                  ),
                  onFieldSubmitted: (value) {
                    setState(() {
                      skills.add(value.trim());
                    });
                  },
                ),
                // Display skills as pills
                Wrap(
                  children: skills
                      .map((skill) => PillSkills(
                          text: skill,
                          onDelete: () {
                            setState(() {
                              skills.remove(skill);
                            });
                          }))
                      .toList(),
                ),

                Text("Benefits", style: Theme.of(context).textTheme.subtitle1),
                ...benefits.asMap().entries.map((entry) {
                  final index = entry.key;
                  final benefit = entry.value;
                  return TextFormField(
                    initialValue: benefit,
                    onChanged: (value) {
                      setState(() {
                        benefits[index] = value;
                      });
                    },
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      print(benefits);
                      benefits.add("");
                    });
                  },
                  child: Text("Add Benefit"),
                ),
                const SizedBox(height: 10),
                Text("Responsibilities",
                    style: Theme.of(context).textTheme.subtitle1),
                ...responsibilities.asMap().entries.map((entry) {
                  final index = entry.key;
                  final responsibility = entry.value;
                  return TextFormField(
                    initialValue: responsibility,
                    onChanged: (value) {
                      setState(() {
                        responsibilities[index] = value;
                      });
                    },
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      responsibilities.add("");
                    });
                  },
                  child: Text("Add Responsibility"),
                ),
                const SizedBox(height: 10),
                Text("Qualifications",
                    style: Theme.of(context).textTheme.subtitle1),
                ...qualifications.asMap().entries.map((entry) {
                  final index = entry.key;
                  final qualification = entry.value;
                  return TextFormField(
                    initialValue: qualification,
                    onChanged: (value) {
                      setState(() {
                        qualifications[index] = value;
                      });
                    },
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      qualifications.add("");
                    });
                  },
                  child: Text("Add Qualification"),
                ),
                const SizedBox(height: 10),
                Text("Extensions",
                    style: Theme.of(context).textTheme.subtitle1),
                ...extensions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final extension = entry.value;
                  return TextFormField(
                    initialValue: extension,
                    onChanged: (value) {
                      setState(() {
                        extensions[index] = value;
                      });
                    },
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      extensions.add("");
                    });
                  },
                  child: Text("Add Extension"),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: remote,
                      onChanged: (value) {
                        setState(() {
                          remote = value!;
                        });
                      },
                    ),
                    Text("Remote "),
                  ],
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
                      widget.job!.id == null
                          ? Icons.person_add_rounded
                          : Icons.save_rounded,
                    ),
                    label: Text(widget.job!.id == null ? 'Add' : 'Save'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        benefits.clear();
                        responsibilities.clear();
                        qualifications.clear();
                        extensions.clear();
                        remote = false;
                      });
                    },
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

class PillSkills extends StatelessWidget {
  PillSkills({required this.text, required this.onDelete, Key? key})
      : super(key: key);

  String text;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onDelete,
            child: Icon(Icons.close, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }
}
