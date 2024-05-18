import 'dart:convert';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/trends/firebase/trends.dart';

Future<bool> addJob(JobModel job) async {
  try {
    final instance = FirebaseFirestore.instance;
    await instance
        .collection('jobs')
        .doc(job.id)
        .set(job.toMap(), SetOptions(merge: true));
    await firestore.collection('jobsUser').doc(currentUser.email).set({
      'postedJobs': FieldValue.arrayUnion([job.id])
    }, SetOptions(merge: true));
    // await firestore.collection('JobRoles').doc(job.title).set({})
    await incrementJobPostedTriend(DateTime.now());
    return true;
  } catch (e) {
    return false;
  }
}

Future<List<JobModel>> getJobs() async {
  List<JobModel> jobs = [];
  try {
    final instance = FirebaseFirestore.instance;
    final resp = await instance
        .collection('jobs')
        .get(const GetOptions(source: Source.serverAndCache));
    resp.docs.forEach((element) {
      jobs.add(JobModel.mapToJobModel(element.data()));
    });

    return jobs;
  } catch (e) {
    return [];
  }
}

Future<JobModel?> getJob(String jobId) async {
  try {
    final instance = FirebaseFirestore.instance;
    final resp = await instance
        .collection('jobs')
        .doc(jobId)
        .get(const GetOptions(source: Source.serverAndCache));
    return JobModel.mapToJobModel(resp.data()!);
  } catch (e) {
    return null;
  }
}

Future<bool> addJobs(List<JobModel> jobs) async {
  try {
    final firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();

    for (final job in jobs) {
      final docRef = firestore.collection('jobs').doc(job.id);
      batch.set(docRef, job.toMap(), SetOptions(merge: true));
    }

    await batch.commit();
    return true;
  } catch (e) {
    print('Error adding jobs: $e');
    return false;
  }
}

Future<bool> updateJob(JobModel job) async {
  try {
    final instance = FirebaseFirestore.instance;
    await instance
        .collection('jobs')
        .doc(job.id)
        .set(job.toMap(), SetOptions(merge: true));
    return true;
  } catch (e) {
    print('Error updating job: $e');
    return false;
  }
}

// Future<bool> applyJob(JobModel job, {String? email}) async {
//   job.candidates.add(email ?? currentUser.email);
//   try {
//     await firestore
//         .collection('jobs')
//         .doc(job.title)
//         .set(job.toMap(), SetOptions(merge: true));
//     final resp = await firestore
//         .collection('appliedJobs')
//         .doc(email ?? currentUser.email)
//         .get();
//     final data = resp.data()!['appliedJobs'] ?? [];
//     data.add(job.id);
//     await firestore
//         .collection('appliedJobs')
//         .doc(email ?? currentUser.email)
//         .set({'appliedJobs': data}, SetOptions(merge: true));
//     return true;
//   } catch (e) {
//     return false;
//   }
// }

Future<bool> applyJob(JobModel job, {String? email}) async {
  try {
    // Create a reference to the Firestore collection once
    final jobRef = firestore.collection('jobs').doc(job.id);
    final appliedJobsRef =
        firestore.collection('jobsUser').doc(email ?? currentUser.email);

    // Update job
    await jobRef.set({
      'candidates': FieldValue.arrayUnion([email ?? currentUser.email])
    }, SetOptions(merge: true));

    // Update appliedJobs
    await appliedJobsRef.set({
      'appliedJobs': FieldValue.arrayUnion([job.id])
    }, SetOptions(merge: true));
    await incrementJobAppliedTriend(DateTime.now());
    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<bool> saveJob(JobModel job, {String? email}) async {
  try {
    final savedJobsRef =
        firestore.collection('jobsUser').doc(email ?? currentUser.email);

    // Update appliedJobs
    await savedJobsRef.set({
      'savedJobs': FieldValue.arrayUnion([job.id])
    }, SetOptions(merge: true));

    return true;
  } catch (e) {
    print('Error: $e');
    return false;
  }
}

Future<List<JobModel>?> getAppliedJobs({String? email}) async {
  try {
    final userEmail = email ?? currentUser.email;
    if (userEmail == null) return null;

    final resp = await firestore
        .collection('jobsUser')
        .doc(userEmail)
        .get(GetOptions(source: Source.serverAndCache));

    final appliedJobs = resp.data()?['appliedJobs'] as List<dynamic>?;
    print(appliedJobs);

    if (appliedJobs == null || appliedJobs.isEmpty) return [];

    final jobDocs = await Future.wait(appliedJobs
        .map((jobId) => firestore.collection('jobs').doc(jobId).get()));

    final appliedJobModels = jobDocs
        .where((jobDoc) => jobDoc.exists)
        .map((jobDoc) => JobModel.mapToJobModel(jobDoc.data()!))
        .toList();

    return appliedJobModels;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

Future<List<JobModel>?> getPostedJobs({String? email}) async {
  try {
    final userEmail = email ?? currentUser.email;
    if (userEmail == null) return null;

    final resp = await firestore.collection('jobsUser').doc(userEmail).get();

    final postedJobs = resp.data()?['postedJobs'] as List<dynamic>?;
    // print(postedJobs);

    if (postedJobs == null || postedJobs.isEmpty) return [];

    final jobDocs = await Future.wait(postedJobs
        .map((jobId) => firestore.collection('jobs').doc(jobId).get()));
    print(jobDocs);
    final postedJobModels = jobDocs
        .where((jobDoc) => jobDoc.exists)
        .map((jobDoc) => JobModel.mapToJobModel(jobDoc.data()!))
        .toList();
    print(postedJobModels);
    return postedJobModels;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

Future<List<JobModel>?> getSavedJobs({String? email}) async {
  try {
    final userEmail = email ?? currentUser.email;
    if (userEmail == null) return null;

    final resp = await firestore
        .collection('jobsUser')
        .doc(userEmail)
        .get(GetOptions(source: Source.serverAndCache));

    final savedJobs = resp.data()?['savedJobs'] as List<dynamic>?;
    print(savedJobs);

    if (savedJobs == null || savedJobs.isEmpty) return [];

    final jobDocs = await Future.wait(savedJobs
        .map((jobId) => firestore.collection('jobs').doc(jobId).get()));

    final appliedJobModels = jobDocs
        .where((jobDoc) => jobDoc.exists)
        .map((jobDoc) => JobModel.mapToJobModel(jobDoc.data()!))
        .toList();

    return appliedJobModels;
  } catch (e) {
    print("Error: $e");
    return null;
  }
}

List<JobModel> filterAndSortJobs(
    List<JobModel> jobList, List<String> recommendedJobsIds) {
  // Filter jobs based on recommended jobs IDs
  List<JobModel> filteredJobs =
      jobList.where((job) => recommendedJobsIds.contains(job.id)).toList();

  // Sort filtered jobs based on the order of recommended jobs IDs
  filteredJobs.sort((a, b) => recommendedJobsIds
      .indexOf(a.id)
      .compareTo(recommendedJobsIds.indexOf(b.id)));

  return filteredJobs;
}

Future<List<JobModel>?> recommendJobs(List<JobModel> list) async {
  final url = Uri.parse("http://127.0.0.1:5000/recommend_jobs");

  // Convert list of JobModel objects into a list of maps
  List<Map<String, dynamic>> jobList = [];
  list.forEach((element) {
    jobList.add({
      'title': element.title.toString(),
      'jobType': element.jobType.toString(),
      'id': element.id.toString(),
      'description': element.description.toString(),
      'qualifications': element.qualifications
          .join('. ')
          .toString(), // Convert list to comma-separated string
      'skills': element.skills
          .join('. ')
          .toString(), // Convert list to comma-separated string
      'responsibilities': element.responsibilities
          .join('. ')
          .toString() // Convert list to comma-separated string
    });
  });

  // print(jobList[0]);

  // Prepare data to send
  Map<String, dynamic> requestData = {
    'userData': {
      'about': currentUser.templateData!.bio,
      'skills': currentUser.templateData!.hobbies
    },
    'jobData': jobList // Include job data
  };

  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData));

    if (response.statusCode == 200) {
      // print("Response received:");
      print(response.body);
      Map<String, dynamic> jsonMap = json.decode(response.body);

      // Extract recommended job IDs
      List<String> recommendedJobsIds =
          List<String>.from(jsonMap['recommended_jobs']);
      return filterAndSortJobs(list, recommendedJobsIds);
    } else {
      print('Failed to fetch recommended jobs, ${response.statusCode}');
      return [];
    }
  } catch (error) {
    print('Error: $error ');
    return null;
  }
}
