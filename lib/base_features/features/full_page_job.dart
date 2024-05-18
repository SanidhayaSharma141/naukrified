import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/view_applicants.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/job_analysis.dart';

import '../atom/pill.dart';

class FullPageJob extends StatefulWidget {
  FullPageJob({Key? key, required this.jobModel}) : super(key: key);
  final JobModel jobModel;

  @override
  _FullPageJobState createState() => _FullPageJobState();
}

class _FullPageJobState extends State<FullPageJob> {
  bool? isApplied;

  @override
  void initState() {
    super.initState();
    checkApplied();
  }

  Future<void> checkApplied() async {
    try {
      final resp =
          await firestore.collection('jobsUser').doc(currentUser.email).get();

      if (resp.exists && resp.data() != null) {
        final appliedJobs = resp.data()!['appliedJobs'] as List<dynamic>;
        setState(() {
          isApplied = appliedJobs.contains(widget.jobModel.id);
        });
      } else {
        setState(() {
          isApplied = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isApplied = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.jobModel.candidates);
    final List<String> pillRandom = ["Security", "Safety"];
    final List<dynamic> extensionsList =
        widget.jobModel.extensions as List<dynamic>;
    final List<dynamic> responsibilityList =
        widget.jobModel.responsibilities as List<dynamic>;
    final List<dynamic> benefitList = widget.jobModel.benefits as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.ctfassets.net/pdf29us7flmy/6AEJD3jnfDk9oTiiqpZmAX/7acbb9511f253642f768f0b397a888e6/irz2tf9w.png?w=720&q=100&fm=jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.jobModel.title.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.jobModel.companyName.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < extensionsList.length; i++)
                  Pill(extensionsList[i] as String? ??
                      pillRandom[i % pillRandom.length]),
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionHeader("Description"),
            SizedBox(height: 8.0),
            Text(
              widget.jobModel.description.toString(),
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16.0),
            _buildSectionHeader("Responsibilities"),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < responsibilityList.length; i++)
                  Text('• ${responsibilityList[i]}'),
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionHeader("Benefits"),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < benefitList.length; i++)
                  Text('• ${benefitList[i]}'),
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionHeader("Skills"),
            SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < widget.jobModel.skills.length; i++)
                  PillData(widget.jobModel.skills[i]),
              ],
            ),
            SizedBox(height: 16.0),
            _buildSectionHeader("Qualifications Required"),
            SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < widget.jobModel.qualifications.length; i++)
                  Text('• ${widget.jobModel.qualifications[i]}'),
              ],
            ),
            SizedBox(height: 16.0),
            if (currentUser.accountType != "Applicant" &&
                currentUser.name == widget.jobModel.companyName)
              GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ApplicantScreen(
                          job: widget.jobModel,
                          candidates:
                              List<String>.from(widget.jobModel.candidates))));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isApplied == true ? Colors.grey : Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Check Applicants",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            if (currentUser.accountType == "Applicant" && isApplied != null)
              GestureDetector(
                onTap: () async {
                  if (!isApplied!) {
                    final resp = await applyJob(widget.jobModel);
                    if (resp) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Applied Successfully')),
                      );
                      setState(() {
                        isApplied = true;
                      });
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: isApplied == true ? Colors.grey : Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      isApplied! ? "Already Applied" : 'Apply Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget _buildDivider() {
  //   return Divider(
  //     height: 20,
  //     thickness: 2,
  //     color: Colors.grey[300],
  //   );
  // }
}
