import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/base_features/models/chat/chat.dart';
import 'package:naukrified/base_features/models/resume_data.dart';
import 'package:naukrified/base_features/screens/profile/profile_preview.dart';
import 'package:naukrified/tools.dart';

class UserData {
  /// Readonly
  String? email;
  String? accountType;
  String? name;
  List<JobOffer>? jobOffers;

  String? fcmToken;
  int modifiedAt = 0;
  TemplateData? templateData;

  /// Editable
  String? phoneNumber, address;
  String? imgUrl;

  UserData({
    this.email,
    this.name,
    this.jobOffers,
    this.templateData,
    this.accountType,
    this.phoneNumber,
    this.address,
    this.imgUrl,
  });

  Map<String, dynamic> encode() {
    return {
      if (phoneNumber != null) "phoneNumber": phoneNumber,
      if (email != null) "email": email,
      if (address != null) "address": address,
      if (imgUrl != null) "imgUrl": imgUrl,
      "templateData":
          templateData == null ? null : convertTemplateDataToMap(templateData!),
      "accountType": accountType,
      "modifiedAt": modifiedAt,
      "fcmToken": fcmToken,
      if (name != null) "name": name,
    };
  }

  void load(Map<String, dynamic> data) {
    phoneNumber = data['phoneNumber'] ?? phoneNumber;
    address = data['address'] ?? address;
    imgUrl = data['imgUrl'] ?? imgUrl;
    accountType = data['accountType'] ?? accountType;
    name = data['name'] ?? name;
    fcmToken = data['fcmToken'] ?? fcmToken;
    modifiedAt = data['modifiedAt'] ?? modifiedAt;
    templateData = data['templateData'] == null
        ? null
        : convertMapToTemplateData(data['templateData']);
  }
}

Future<void> createUserData(UserData data) async {
  final response =
      await firestore.collection('users').doc(data.email).set(data.encode());
  return;
}

// Future<void> initializeUsers() async {
//   const String key = 'usersLastModifiedAt';
//   int usersLastModifiedAt = prefs!.getInt(key) ?? -1;
//   // if (usersLastModifiedAt == -1) {
//   //   try {
//   //     usersLastModifiedAt = (await firestore
//   //             .collection('users')
//   //             .orderBy('modifiedAt', descending: true)
//   //             .limit(1)
//   //             .get(const GetOptions(source: Source.cache)))
//   //         .docs[0]
//   //         .data()['modifiedAt'];
//   //   } catch (e) {
//   //     // if data doesn't exists in cache then do nothing
//   //   }
//   // }
//   final response = await firestore
//       .collection('users')
//       .where(
//         'modifiedAt',
//         isGreaterThan: usersLastModifiedAt,
//       )
//       .get();
//   int maxModifiedAt = usersLastModifiedAt;
//   for (var doc in response.docs) {
//     maxModifiedAt = max(
//         maxModifiedAt, (UserData(email: doc.id)..load(doc.data())).modifiedAt);
//   }
//   prefs!.setInt(key, maxModifiedAt);
// }

Future<UserData> fetchUserData(String email,
    {Source? src = Source.cache}) async {
  UserData userData = UserData(
    email: email,
  );
  DocumentSnapshot<Map<String, dynamic>>? response;
  response = await firestore.collection('users').doc(email).get();
  userData.load(response.data() ?? {});
  if (userData.accountType == 'Applicant') {
    List<JobOffer> list = [];
    final resp = await firestore
        .collection('users')
        .doc('jobOffers')
        .collection('offers')
        .get(GetOptions(source: Source.serverAndCache));
    resp.docs.forEach((element) {
      list.add(JobOffer(
          isClosed: element.data()['isClosed'] ?? false,
          isResp: element.data()['isResp'] ?? false,
          jobId: element.id));
    });
    userData.jobOffers = list;
  }
  return userData;
}

class JobOffer {
  bool isClosed;
  bool isResp;
  String jobId;
  JobOffer({required this.isClosed, required this.isResp, required this.jobId});
}

/// this fetches all properties
Future<List<UserData>> fetchUsers({List<String>? emails}) async {
  if (emails != null) {
    return [for (final email in emails) await fetchUserData(email)];
  }
  final response = await firestore
      .collection('users')
      .get(const GetOptions(source: Source.cache));
  return response.docs
      .map((doc) => UserData(email: doc.id)..load(doc.data()))
      .toList();
  // return [
  //   for (final doc in (await firestore.collection('users').get(
  //             GetOptions(source: Source.cache),
  //           ))
  //       .docs)
  //     await fetchUserData(doc.id, src: src)
  // ];
}

Future<void> updateUserData(UserData userData) async {
  final batch = firestore.batch();
  userData.modifiedAt = DateTime.now().millisecondsSinceEpoch;
  batch.set(
    firestore.collection('users').doc(userData.email),
    userData.encode(),
  );
  // // if account doesn't exists create one
  // if (currentUser.isAdmin == true) {
  //   try {
  // await auth.createUserWithEmailAndPassword(
  //   email: userData.email!,
  //   password: "123456",
  // );
  //     // login(currentUser.email!, '123456');
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code != 'email-already-in-use') {
  //       rethrow;
  //     }
  //   }
  // }
  batch.set(firestore.doc('modifiedAt/users'), {
    "lastModifiedAt": userData.modifiedAt,
  });
  await batch.commit();
}

/// This function is responsible for logging user in
Future<void> login(String email, String password) async {
  await auth.signInWithEmailAndPassword(email: email, password: password);
}

UserData currentUser = UserData();

/// A widget used to display widget using UserData
/// This will change according to the userData
// ignore: must_be_immutable
class UserBuilder extends StatelessWidget {
  final String email;
  final Widget Function(BuildContext ctx, UserData userData) builder;
  final Widget? loadingWidget;
  UserBuilder({
    super.key,
    required this.email,
    required this.builder,
    this.loadingWidget,
  });

  UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserData(email),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          userData = UserData(email: email, name: email);
          // Returning this Widget when nothing has arrived
          return loadingWidget ?? builder(ctx, userData);
        }
        // Returning this widget when data arrives from server
        userData = snapshot.data!;
        return builder(ctx, userData);
      },
    );
  }
}

/// A widget used to display widget using UserData
/// This will change according to the userData
// ignore: must_be_immutable
class UsersBuilder extends StatelessWidget {
  final List<String>? emails;
  final Widget Function(BuildContext ctx, List<UserData> users) builder;
  final Future<List<UserData>> Function()? provider;
  final Widget? loadingWidget;
  const UsersBuilder({
    super.key,
    required this.builder,
    this.loadingWidget,
    this.provider,
    this.emails,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: provider != null ? provider!() : fetchUsers(emails: emails),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return loadingWidget ?? circularProgressIndicator();
        }
        return builder(ctx, snapshot.data!);
      },
    );
  }
}

Future showUserPreview(BuildContext context, UserData user) {
  return Navigator.of(context).push(
    DialogRoute(
      context: context,
      builder: (ctx) => AlertDialog(
        contentPadding: const EdgeInsets.only(
          top: 40,
          bottom: 20,
          right: 10,
          left: 10,
        ),
        content: ProfilePreview(user: user),
      ),
    ),
  );
}
