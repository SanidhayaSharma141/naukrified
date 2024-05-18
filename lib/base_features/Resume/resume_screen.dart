import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naukrified/base_features/models/resume_data.dart';

class ResumeScreen extends ConsumerStatefulWidget {
  ResumeScreen({super.key, this.data, required this.resumeType});
  String resumeType;
  TemplateData? data;

  @override
  ConsumerState<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends ConsumerState<ResumeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.resumeType == "business") {
      tempTheme = TemplateTheme.business;
    } else if (widget.resumeType == "classic") {
      tempTheme = TemplateTheme.classic;
    } else if (widget.resumeType == "model") {
      tempTheme = TemplateTheme.modern;
    } else if (widget.resumeType == "none") {
      tempTheme = TemplateTheme.none;
    } else {
      tempTheme = TemplateTheme.technical;
    }
  }

  TemplateTheme tempTheme = TemplateTheme.technical;

  @override
  Widget build(BuildContext context) {
    final x =
        widget.data == null ? ref.watch(templateDataProvider) : widget.data;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Resume'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: FlutterResumeTemplate(
            data: x,
            enableDivider: true,
            maxLinesExperience: 10,
            showButtons: true,
            hobbiesPlaceholder: "Skills",
            templateTheme: tempTheme,
            mode: TemplateMode.readOnlyMode,
            onSaveResume: (globalKey) async =>
                await PdfHandler().createPDF(globalKey),
          ),
        ),
      ),
    );
  }
}
