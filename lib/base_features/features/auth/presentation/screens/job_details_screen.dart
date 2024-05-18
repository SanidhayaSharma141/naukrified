import 'package:flutter/material.dart';
import 'package:naukrified/base_features/features/full_page_job.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';

class JobDetailsScreen extends StatefulWidget {
  JobDetailsScreen({super.key, required this.jobId});
  String jobId;
  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getJob(widget.jobId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return Center(child: Text("Waiting..."));
          }
          return FullPageJob(jobModel: snapshot.data!);
        },
      ),
    );
  }
}
