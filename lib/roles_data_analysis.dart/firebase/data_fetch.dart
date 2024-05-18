import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';

Future<bool> uploadJobRole({required JobRole jobRole}) async {
  try {
    await firestore
        .collection('JobRoles')
        .doc(jobRole.jobTitle)
        .set(jobRole.toJson(), SetOptions(merge: true));
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<JobRole?> getJobRole(String jobTitle) async {
  try {
    final resp = await firestore
        .collection('JobRoles')
        .doc(jobTitle)
        .get(const GetOptions(source: Source.serverAndCache));
    return resp.data() == null ? null : JobRole.fromJson(resp.data()!);
  } catch (e) {
    return null;
  }
}

Future<dynamic> getJobRoles() async {
  try {
    List<JobRole> jobRoles = [];
    print("hi");
    final resp = await firestore.collection('JobRoles').get();
    print("hi");
    print(resp);
    // return resp.docs[0].data()!['jobTitle'];
    resp.docs.forEach((element) {
      // print(element.data());
      jobRoles.add(JobRole.fromJson(element.data()));
    });

    // print(jobRoles);
    return jobRoles;
  } catch (e) {
    return [];
  }
}
