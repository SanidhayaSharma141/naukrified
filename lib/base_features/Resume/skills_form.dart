import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/Resume/language_form.dart';
import 'package:naukrified/base_features/models/resume_data.dart';

class SkillsForm extends ConsumerStatefulWidget {
  TemplateData? data;
  SkillsForm({required this.data});
  @override
  _SkillsFormState createState() => _SkillsFormState();
}

class _SkillsFormState extends ConsumerState<SkillsForm> {
  List<String> _skills = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null && widget.data!.hobbies != null) {
      _skills = widget.data!.hobbies!;
    }
  }

  void _addSkill() {
    setState(() {
      _skills.add('');
    });
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skills:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onChanged: (value) {
                              _skills[index] = value;
                            },
                            initialValue: _skills[index],
                            decoration: InputDecoration(
                              labelText: 'Skill ${index + 1}',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeSkill(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addSkill,
              child: Text('Add Skill'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(templateDataProvider.notifier).updateHobbies(_skills);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => LanguageFormWidget(
                          data: widget.data,
                        )));
              },
              child: Text("Next"),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
