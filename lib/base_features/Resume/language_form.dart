import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/Resume/data.dart';
import 'package:naukrified/base_features/Resume/resume_screen.dart';
import 'package:naukrified/base_features/firebase/personal_details.dart';
import 'package:naukrified/base_features/models/resume_data.dart';

class LanguageVal {
  String langName;
  int level;

  LanguageVal(this.langName, this.level);
}

class LanguageFormWidget extends ConsumerStatefulWidget {
  TemplateData? data;
  LanguageFormWidget({required this.data});
  @override
  _LanguageFormWidgetState createState() => _LanguageFormWidgetState();
}

class _LanguageFormWidgetState extends ConsumerState<LanguageFormWidget> {
  List<LanguageVal> _languages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data != null && widget.data!.languages != null) {
      assignValues();
    }
  }

  void assignValues() {
    for (int i = 0; i < widget.data!.languages!.length; i++) {
      _languages.add(LanguageVal(widget.data!.languages![i].language,
          widget.data!.languages![i].level));
    }
  }

  void _addLanguage() {
    setState(() {
      _languages.add(LanguageVal('', 1)); // Default level set to 1
    });
  }

  void _removeLanguage(int index) {
    setState(() {
      _languages.removeAt(index);
    });
  }

  TextEditingController resumeType = TextEditingController(text: "business");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Languages:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            onChanged: (value) {
                              _languages[index].langName = value;
                            },
                            initialValue: _languages[index].langName,
                            decoration: InputDecoration(
                              labelText: 'Language ${index + 1}',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<int>(
                            value: _languages[index].level,
                            onChanged: (value) {
                              setState(() {
                                _languages[index].level = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Level',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            items: List.generate(5, (index) => index + 1)
                                .map<DropdownMenuItem<int>>((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text('$value'),
                              );
                            }).toList(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeLanguage(index);
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
              onPressed: _addLanguage,
              child: Text('Add Language'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                List<Language> langs = [];
                for (int i = 0; i < _languages.length; i++) {
                  langs.add(
                      Language(_languages[i].langName, _languages[i].level));
                }
                ref.read(templateDataProvider.notifier).updateLanguages(langs);
                final data = ref.watch(templateDataProvider);
                await setPersonalDetails(data);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ResumeScreen(resumeType: resumeType.text)));
              },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            ResumeTypeWidget(resumeType: resumeType)
          ],
        ),
      ),
    );
  }
}

class ResumeTypeWidget extends StatefulWidget {
  TextEditingController resumeType;
  ResumeTypeWidget({required this.resumeType});
  @override
  _ResumeTypeWidgetState createState() => _ResumeTypeWidgetState();
}

class _ResumeTypeWidgetState extends State<ResumeTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.resumeType.text,
      onChanged: (value) {
        setState(() {
          widget.resumeType.text = value!;
        });
      },
      decoration: InputDecoration(
        labelText: 'Select Option',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      items: [
        DropdownMenuItem<String>(
          value: 'business',
          child: Text('Business'),
        ),
        DropdownMenuItem<String>(
          value: 'classic',
          child: Text('Classic'),
        ),
        DropdownMenuItem<String>(
          value: 'none',
          child: Text('None'),
        ),
        DropdownMenuItem<String>(
          value: 'model',
          child: Text('Model'),
        ),
        DropdownMenuItem<String>(
          value: 'technical',
          child: Text('Technical'),
        ),
        DropdownMenuItem<String>(
          value: 'globalTextTheme',
          child: Text('Global Text Theme'),
        ),
      ],
    );
  }
}
