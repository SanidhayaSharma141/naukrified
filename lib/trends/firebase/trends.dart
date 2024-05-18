import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/trends/model/trend.dart';

Future<bool> incrementJobAppliedTriend(DateTime date) async {
  try {
    await firestore.collection("Trends").doc("jobApplied").set({
      'data': {DateFormat('yyyy-MM-dd').format(date): FieldValue.increment(1)}
    });
    return true;
  } catch (e) {
    return false;
  }
}

Map<String, double> dummyData = {
  "2024-04-01": 100.0,
  "2024-04-02": 120.0,
  "2024-04-03": 110.0,
  "2024-04-04": 130.0,
  "2024-04-05": 125.0,
  "2024-04-06": 140.0,
  "2024-04-07": 145.0,
  "2024-04-08": 150.0,
  "2024-04-09": 155.0,
  "2024-04-10": 160.0,
  "2024-04-11": 165.0,
  "2024-04-12": 170.0,
  "2024-04-13": 175.0,
  "2024-04-14": 180.0,
  "2024-04-15": 185.0,
  "2024-04-16": 190.0,
  "2024-04-17": 195.0,
  "2024-04-18": 200.0,
  "2024-04-19": 205.0,
  "2024-04-20": 210.0,
  "2024-04-21": 215.0,
  "2024-04-22": 220.0,
  "2024-04-23": 225.0,
  "2024-04-24": 230.0,
  "2024-04-25": 235.0,
  "2024-04-26": 240.0,
  "2024-04-27": 245.0,
  "2024-04-28": 250.0,
  "2024-04-29": 255.0,
  "2024-04-30": 260.0,
  "2024-05-01": 265.0,
  "2024-05-02": 270.0,
  "2024-05-03": 275.0,
  "2024-05-04": 280.0,
  "2024-05-05": 285.0,
};

Future<bool> postData() async {
  await firestore
      .collection('Trends')
      .doc('averageSalary')
      .set({'data': dummyData});
  await firestore
      .collection('Trends')
      .doc('jobSelected')
      .set({'data': dummyData});
  return true;
}

Future<bool> incrementJobPostedTriend(DateTime date) async {
  try {
    await firestore
        .collection("Trends")
        .doc("jobPosted")
        .set({DateFormat('yyyy-MM-dd').format(date): FieldValue.increment(1)});
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> incrementJobSelectedTriend(DateTime date) async {
  try {
    await firestore
        .collection("Trends")
        .doc("jobSelected")
        .set({DateFormat('yyyy-MM-dd').format(date): FieldValue.increment(1)});
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateAverageSalary(DateTime date,
    {required double change, required incjobSelected}) async {
  try {
    final resp1 = await firestore.collection("Trends").doc("jobSelected").get();
    final resp =
        await firestore.collection("Trends").doc("averageSalary").get();
    if (resp.exists && resp1.exists) {
      final val =
          (resp.data()![DateFormat('yyyy-MM-dd').format(date)] + change) /
              (incjobSelected
                  ? resp1.data()![DateFormat('yyyy-MM-dd').format(date)] + 1
                  : resp1.data()![DateFormat('yyyy-MM-dd').format(date)]);
      if (incjobSelected) {
        await firestore.collection("Trends").doc("jobSelected").set({
          DateFormat('yyyy-MM-dd').format(date):
              resp1.data()![DateFormat('yyyy-MM-dd').format(date)] + 1
        }, SetOptions(merge: true));
      }
      await firestore
          .collection("Trends")
          .doc("averageSalary")
          .set({DateFormat('yyyy-MM-dd').format(date): val});
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

Future<Trends> getTrendsData() async {
  final snapshot = await FirebaseFirestore.instance
      .collection('Trends')
      .get(GetOptions(source: Source.serverAndCache));

  Map<String, double> jobApplied = {};
  Map<String, double> jobSelected = {};
  Map<String, double> jobPosted = {};
  Map<String, double> averageSalary = {};

  snapshot.docs.forEach((doc) {
    var data = doc.data();
    if (doc.id == "jobApplied") {
      jobApplied = Map<String, double>.from(data['data']);
    } else if (doc.id == "jobPosted") {
      jobPosted = Map<String, double>.from(data['data']);
    } else if (doc.id == "jobSelected") {
      jobSelected = Map<String, double>.from(data['data']);
    } else {
      averageSalary = Map<String, double>.from(data['data']);
    }
  });
  return Trends(
    jobApplied: jobApplied,
    jobSelected: jobSelected,
    jobPosted: jobPosted,
    averageSalary: averageSalary,
  );
}
