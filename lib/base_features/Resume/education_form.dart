import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/Resume/data.dart';
import 'package:naukrified/base_features/Resume/resume_screen.dart';
import 'package:naukrified/base_features/Resume/skills_form.dart';
import 'package:naukrified/base_features/models/resume_data.dart';

class _Education {
  String schoolLevel;
  String schoolName;

  _Education(this.schoolLevel, this.schoolName);
}

class EducationFormWidget extends StatefulWidget {
  final List<_Education> educations;
  final Function(List<_Education>) onEducationsChanged;

  const EducationFormWidget({
    Key? key,
    required this.educations,
    required this.onEducationsChanged,
  }) : super(key: key);

  @override
  _EducationFormWidgetState createState() => _EducationFormWidgetState();
}

class _EducationFormWidgetState extends State<EducationFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int index = 0; index < widget.educations.length; index++)
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: widget.educations[index].schoolLevel,
                  onChanged: (value) {
                    widget.educations[index].schoolLevel = value;
                    widget.onEducationsChanged(widget.educations);
                  },
                  decoration: InputDecoration(labelText: 'School Level'),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  initialValue: widget.educations[index].schoolName,
                  onChanged: (value) {
                    widget.educations[index].schoolName = value;
                    widget.onEducationsChanged(widget.educations);
                  },
                  decoration: InputDecoration(labelText: 'School Name'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.educations.removeAt(index);
                    widget.onEducationsChanged(widget.educations);
                  });
                },
              ),
            ],
          ),
        SizedBox(height: 10),
        TextButton.icon(
          onPressed: () {
            setState(() {
              widget.educations.add(_Education('', ''));
              widget.onEducationsChanged(widget.educations);
            });
          },
          icon: Icon(Icons.add),
          label: Text('Add Education'),
        ),
      ],
    );
  }
}

// Example usage:
class EducationPage extends ConsumerStatefulWidget {
  TemplateData? data;
  EducationPage({super.key, this.data});
  @override
  _EducationPageState createState() => _EducationPageState();
}

class _EducationPageState extends ConsumerState<EducationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null && widget.data!.educationDetails != null) {
      for (int i = 0; i < widget.data!.educationDetails!.length; i++) {
        _educations.add(_Education(
            widget.data!.educationDetails![i].schoolLevel,
            widget.data!.educationDetails![i].schoolName));
      }
      setState(() {});
    }
  }

  List<_Education> _educations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Education')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EducationFormWidget(
              educations: _educations,
              onEducationsChanged: (educations) {
                setState(() {
                  _educations = educations;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  List<Education> educations = [];
                  for (final ed in _educations) {
                    educations.add(Education(ed.schoolLevel, ed.schoolName));
                  }
                  ref
                      .read(templateDataProvider.notifier)
                      .updateEducationDetails(educations);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SkillsForm(
                            data: widget.data,
                          )));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
