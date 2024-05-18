import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/job_details_screen.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/main.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => JobDetailsScreen(
                              jobId: currentUser.jobOffers![index].jobId,
                            )));
                  },
                  child: Text("Job Offer")),
              tileColor: currentUser.jobOffers![index].isClosed
                  ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.8),
              trailing: currentUser.jobOffers![index].isClosed
                  ? Text('Closed')
                  : Wrap(
                      children: [
                        IconButton(
                            onPressed: () async {
                              await firestore
                                  .collection('users')
                                  .doc(currentUser.email)
                                  .collection('offers')
                                  .doc(currentUser.jobOffers![index].jobId)
                                  .set({'isResp': false, 'isClosed': true},
                                      SetOptions(merge: true));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Offer rejected')));
                              setState(() {
                                currentUser.jobOffers![index].isClosed = true;
                              });
                            },
                            icon: Icon(Icons.cancel)),
                        IconButton(
                            onPressed: () async {
                              await firestore
                                  .collection('users')
                                  .doc(currentUser.email)
                                  .collection('offers')
                                  .doc(currentUser.jobOffers![index].jobId)
                                  .set({'isResp': true, 'isClosed': true},
                                      SetOptions(merge: true));
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Conratulations, you are selected for this job!, You are indeed naukrified!!')));
                              setState(() {
                                currentUser.jobOffers![index].isClosed = true;
                              });
                            },
                            icon: Icon(Icons.check))
                      ],
                    ));
        },
        itemCount: currentUser.jobOffers?.length ?? 0,
      ),
    );
  }
}
