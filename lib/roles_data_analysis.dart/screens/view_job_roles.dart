import 'package:flutter/material.dart';
import 'package:naukrified/roles_data_analysis.dart/firebase/data_fetch.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/job_analysis.dart';

class ViewJobRolesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Roles'),
      ),
      body: FutureBuilder(
        future:
            getJobRoles(), // Assume fetchJobRoles is a function that fetches the list of JobRoles asynchronously
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          // return Text(snapshot.data!.toString());
          else {
            List<JobRole> jobRoles = snapshot.data!;
            return ListView.builder(
              itemCount: jobRoles.length,
              itemBuilder: (context, index) {
                return JobCard(jobRole: jobRoles[index]);
              },
            );
          }
        },
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobRole jobRole;

  const JobCard({required this.jobRole});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => JobAnalysisScreen(jobRole: jobRole)));
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.work),
          ),
          title: Text(jobRole.jobTitle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Average Salary:${jobRole.averageSalary}'), // Calculating average salary
              Text('Job Type: ${jobRole.jobType}'),
            ],
          ),
          // Add onTap functionality if needed
        ),
      ),
    );
  }
}
