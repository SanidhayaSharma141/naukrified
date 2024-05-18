import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/Resume/education_form.dart';
import 'package:naukrified/base_features/models/resume_data.dart';

class ExperienceForm extends ConsumerStatefulWidget {
  ExperienceForm({this.data});
  final TemplateData? data;
  @override
  _ExperienceFormState createState() => _ExperienceFormState();
}

class _ExperienceFormState extends ConsumerState<ExperienceForm> {
  List<ExperienceData> experiences = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null && widget.data!.experience != null) {
      assignVals();
    }
  }

  void assignVals() {
    for (int i = 0; i < widget.data!.experience!.length; i++) {
      experiences.add(ExperienceData(
          experienceTitle: widget.data!.experience![i].experienceTitle,
          experiencePlace: widget.data!.experience![i].experiencePlace,
          experiencePeriod: widget.data!.experience![i].experiencePeriod,
          experienceLocation: widget.data!.experience![i].experienceLocation,
          experienceDescription:
              widget.data!.experience![i].experienceDescription));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Experience Form'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: experiences.length,
              itemBuilder: (context, index) =>
                  _buildExperienceSection(experiences[index]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(templateDataProvider.notifier)
                  .updateExperience(experiences);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EducationPage(data: widget.data)),
              );
            },
            child: const Text('Next'),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Back'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExperience,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildExperienceSection(ExperienceData experience) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              initialValue: experience.experienceTitle,
              onChanged: (value) => experience.experienceTitle = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Place',
                border: OutlineInputBorder(),
              ),
              initialValue: experience.experiencePlace,
              onChanged: (value) => experience.experiencePlace = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Period',
                border: OutlineInputBorder(),
              ),
              initialValue: experience.experiencePeriod,
              onChanged: (value) => experience.experiencePeriod = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
              initialValue: experience.experienceLocation,
              onChanged: (value) => experience.experienceLocation = value,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              initialValue: experience.experienceDescription,
              onChanged: (value) => experience.experienceDescription = value,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteExperience(experience),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _addExperience() {
    setState(() {
      experiences.add(ExperienceData(
          experienceTitle: "",
          experiencePlace: "",
          experiencePeriod: "",
          experienceLocation: "",
          experienceDescription: ""));
    });
  }

  void _deleteExperience(ExperienceData experience) {
    setState(() {
      experiences.remove(experience);
    });
  }
}
