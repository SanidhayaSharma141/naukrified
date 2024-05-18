import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naukrified/base_features/Resume/resume_screen.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/main.dart';

class ApplicantScreen extends StatefulWidget {
  ApplicantScreen({Key? key, required this.candidates, required this.job})
      : super(key: key);
  List<String> candidates;
  JobModel job;
  @override
  _ApplicantScreenState createState() => _ApplicantScreenState();
}

class Applicant {
  final String name;
  final String title;
  final String photoUrl;
  final DateTime appliedOn;

  Applicant(
      {required this.name,
      required this.title,
      required this.photoUrl,
      required this.appliedOn});
}

class _ApplicantScreenState extends State<ApplicantScreen> {
  // Function to fetch the list of applicants
  Future<List<UserData>> getApplicants() async {
    // Replace this with your actual API call to fetch applicants
    final data = await fetchUsers(emails: widget.candidates);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants'),
      ),
      body: FutureBuilder(
        future: getApplicants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<UserData> applicants = snapshot.data!;
            return ListView.builder(
              itemCount: applicants.length,
              itemBuilder: (context, index) {
                final applicant = applicants[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: applicant.imgUrl == null
                        ? null
                        : NetworkImage(applicant.imgUrl!),
                  ),
                  title: Text(applicant.name!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(applicant.templateData?.currentPosition ?? ""),
                    ],
                  ),
                  onTap: () {
                    // Navigate to another screen on tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApplicantDetailScreen(
                                user: applicant,
                                job: widget.job,
                              )),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class ApplicantDetailScreen extends StatelessWidget {
  final UserData user;
  JobModel job;

  ApplicantDetailScreen({Key? key, required this.user, required this.job})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicant Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  user.imgUrl == null ? null : NetworkImage(user.imgUrl!),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              user.name!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              user.templateData?.currentPosition ?? "",
              style: TextStyle(fontSize: 18),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ResumeScreen(
                                      resumeType: "classic",
                                      data: user.templateData,
                                    ))),
                        child: Text("View Resume"))),
                SizedBox(
                  height: 4,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton(
                        onPressed: () async {
                          await firestore
                              .collection('users')
                              .doc(user.email!)
                              .collection('offers')
                              .doc(job.id)
                              .set(
                                  {'isClosed': false}, SetOptions(merge: true));
                        },
                        child: Text("Offer Job"))),
              ],
            ),
            // You can add more details here if needed
          ],
        ),
      ),
    );
  }
}
