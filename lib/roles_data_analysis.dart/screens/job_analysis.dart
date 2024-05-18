import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:naukrified/base_features/atom/pill.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/models/chat/chat.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/chat/chat_screen.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/chatbot/chat_bot_screen.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/roles_data_analysis.dart/firebase/data_fetch.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/review_post.dart';
import 'package:naukrified/roles_data_analysis.dart/widgets/charts.dart';

class JobAnalysisScreen extends StatelessWidget {
  JobRole jobRole;

  JobAnalysisScreen({required this.jobRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Role Details'),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddReviewScreen(
                          jobRole: jobRole,
                        )));
                // for (final x in jobList) {
                //   await uploadJobRole(jobRole: x);
                // }
              },
              icon: Icon(Icons.rate_review))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  "https://images.ctfassets.net/pdf29us7flmy/6CUCq15966GPkPR9gJbPSP/2fd7431ed38ec4fb8ca16365868e7c8e/Virtual_Interview_8.png?w=720&q=100&fm=jpg"),
              SizedBox(height: 20),
              Text(
                jobRole.jobTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                child: InkWell(
                  child: Text(
                    jobRole.description,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Trends',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              JobCharts(
                  data: jobRole.jobsPosted, heading: "Job posting trends"),
              SizedBox(height: 20),
              JobCharts(
                data: jobRole.jobSalary,
                heading: "Salary Trends",
              ),
              SizedBox(height: 20),
              Text(
                'Ratings:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: jobRole.ratings.entries.map((entry) {
                  return Row(
                    children: [
                      Expanded(child: Text(entry.key)),
                      RatingBarIndicator(
                        rating: entry.value,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Skills:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: jobRole.skills.map((skill) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PillData(skill),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Job Type:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(jobRole.jobType),
              SizedBox(height: 20),
              Text(
                'Reviews:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: jobRole.reviews.map((review) {
                    return ReviewWidget(
                      review: review,
                      jobRole: jobRole,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Keywords:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: jobRole.keywords.map((keyword) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PillData(keyword),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PillData extends StatelessWidget {
  const PillData(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.darkTitleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(16, context),
        vertical: scaleHeight(5, context),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: scaleWidth(11, context),
          color: ColorStyles.splashGradient1,
        ),
      ),
    );
  }
}

class ReviewWidget extends StatefulWidget {
  final Review review;
  JobRole jobRole;

  ReviewWidget({Key? key, required this.review, required this.jobRole})
      : super(key: key);

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  bool _isUseful = false;

  void _showFullDescription() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Review Description'),
          content: SingleChildScrollView(
            child: Text(widget.review.description),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                final String id =
                    (currentUser.email!.compareTo(widget.review.email) < 0)
                        ? "${currentUser.email}-${widget.review.email}"
                        : "${widget.review.email}-${currentUser.email}";
                firestore.collection('chats').doc(id).set({
                  'recipients': [currentUser.email, widget.review.email],
                });
                showChat(context, id: id, emails: [widget.review.email]);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        child: ClipOval(
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.review.name,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Text(
                    widget.review.email,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: _showFullDescription,
                child: Text(
                  widget.review.description,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Useful: ${widget.review.usefulBy}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        _isUseful
                            ? Icons.thumb_up_alt
                            : Icons.thumb_up_alt_outlined,
                        color: _isUseful ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () async {
                        widget.jobRole.reviews.map((element) {
                          if (element.email == widget.review.email) {
                            element.usefulBy = _isUseful
                                ? element.usefulBy - 1
                                : element.usefulBy + 1;
                          }
                        });
                        await uploadJobRole(jobRole: widget.jobRole);
                        setState(() {
                          _isUseful = !_isUseful;
                          if (_isUseful) {
                            widget.review.usefulBy++;
                          } else {
                            widget.review.usefulBy--;
                          }
                        });
                      },
                    ),
                    Expanded(
                        child: Text(
                            "Posted on: ${DateFormat("yyyy-MM-dd").format(widget.review.postDate)}"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
