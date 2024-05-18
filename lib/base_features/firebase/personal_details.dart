import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:naukrified/base_features/models/resume_data.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:http/http.dart' as http;

Future<bool> setPersonalDetails(TemplateData data) async {
  try {
    final instance = FirebaseFirestore.instance;
    final email = FirebaseAuth.instance.currentUser!.email;
    await instance.collection('users').doc(email).set(
        {"templateData": convertTemplateDataToMap(data)},
        SetOptions(merge: true));
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<TemplateData?> getPersonalDetails({String? emailVal}) async {
  try {
    final instance = FirebaseFirestore.instance;
    final email = emailVal ?? FirebaseAuth.instance.currentUser!.email;
    final resp = await instance
        .collection('users')
        .doc(email)
        .get(GetOptions(source: Source.serverAndCache));
    return resp.data() == null || resp.data()!['templateData'] == null
        ? null
        : convertMapToTemplateData(resp.data()!['templateData']);
  } catch (e) {
    print(e);
    return null;
  }
}

// // print(jobList[0]);
// List<UserData> filterAndSortUsers(
//     List<UserData> userdata, List<String> similarUserEmails) {
//   // Filter jobs based on recommended jobs IDs
//   List<UserData> filteredUsers =
//       userdata.where((user) => similarUserEmails.contains(user.email)).toList();

//   // Sort filtered jobs based on the order of recommended jobs IDs
//   filteredUsers.sort((a, b) => similarUserEmails
//       .indexOf(a.email!)
//       .compareTo(similarUserEmails.indexOf(b.email!)));

//   return filteredUsers;
// }

// Future<List<UserData>?> similarUserProfiles(List<UserData> list) async {
//   final url = Uri.parse("http://127.0.0.1:5000/similar_users");

//   // Convert list of JobModel objects into a list of maps
//   List<Map<String, dynamic>> userList = [];
//   list.forEach((element) {
//     if (element.email != currentUser.email) {
//       userList.add({
//         "email": element.email,
//         "skills": element.templateData?.hobbies ?? "",
//         "education":
//             convertEducationToMap(element.templateData?.educationDetails),
//         "experience": convertExperiencetoMap(element.templateData?.experience),
//         "bio": element.templateData?.bio ?? " ",
//         "currentPosition": element.templateData?.currentPosition ?? " "
//       });
//     }
//   });
//   // Prepare data to send
//   Map<String, dynamic> requestData = {
//     'userData': userList,
//     'details': {
//       "email": currentUser.email,
//       "skills": currentUser.templateData?.hobbies ?? "",
//       "education":
//           convertEducationToMap(currentUser.templateData?.educationDetails).,
//       "experience":
//           convertExperiencetoMap(currentUser.templateData?.experience),
//       "bio": currentUser.templateData?.bio ?? " ",
//       "currentPosition": currentUser.templateData?.currentPosition ?? " "
//     } // Include job data
//   };

//   try {
//     final response = await http.post(url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(requestData));

//     if (response.statusCode == 200) {
//       // print("Response received:");
//       print(response.body);
//       Map<String, dynamic> jsonMap = json.decode(response.body);

//       // Extract recommended job IDs
//       List<String> recommendedJobsIds =
//           List<String>.from(jsonMap['similar_users']);
//       return filterAndSortUsers(list, recommendedJobsIds);
//     } else {
//       print('Failed to fetch recommended jobs, ${response.statusCode}');
//       return [];
//     }
//   } catch (error) {
//     print('Error: $error ');
//     return null;
//   }
// }
