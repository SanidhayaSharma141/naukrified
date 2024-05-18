import 'package:flutter/material.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/roles_data_analysis.dart/firebase/data_fetch.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';

class AddReviewScreen extends StatefulWidget {
  JobRole jobRole;

  AddReviewScreen({Key? key, required this.jobRole}) : super(key: key);

  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.jobRole.reviews.any((map) => map.email == currentUser.email)) {
      Review x = widget.jobRole.reviews
          .firstWhere((map) => map.email == currentUser.email);
      _reviewController.text = x.description;
      _companyController.text = x.companyName;
    }
  }

  final TextEditingController _reviewController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  Map<String, double> _rating = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Review & Rating'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Review',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _reviewController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Write your review here...',
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _companyController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Company Name',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Work Life Balance',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _rating["Work Life Balance"] ?? 0,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _rating["Work Life Balance"] = value;
                });
              },
              label: _rating["Work Life Balance"].toString(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Job Satisfaction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _rating['Job Satisfaction'] ?? 0,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _rating['Job Satisfaction'] = value;
                });
              },
              label: _rating['Job Satisfaction'].toString(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Workload and Stress Level',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _rating['Workload and Stress Level'] ?? 0,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _rating['Workload and Stress Level'] = value;
                });
              },
              label: _rating['Workload and Stress Level'].toString(),
            ),
            SizedBox(height: 16.0),
            Text(
              'Career Growth',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _rating['Career Growth'] ?? 0,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: (value) {
                setState(() {
                  _rating['Career Growth'] = value;
                });
              },
              label: _rating['Career Growth'].toString(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                Review newReview = Review(
                  email: currentUser.email!,
                  name: currentUser.name!,
                  companyName: _companyController.text,
                  description: _reviewController.text,
                  postDate: DateTime.now(),
                  usefulBy: 0, // Assuming initial useful count is 0
                );
                final mul = widget.jobRole.ratingCount;
                if (mul == 0) {
                  widget.jobRole.ratings = _rating;
                }
                widget.jobRole.ratingCount = mul + 1;

                widget.jobRole.ratings.forEach((key, value) {
                  // print(_rating[key]);
                  widget.jobRole.ratings[key] =
                      ((value * (mul)) + _rating[key]!) /
                          widget.jobRole.ratingCount;
                });
                print(widget.jobRole.ratings);
                widget.jobRole.reviews.add(newReview);
                await uploadJobRole(jobRole: widget.jobRole);
                // Here you can save the new review
                // For example: saveReview(newReview);
                Navigator.pop(context); // Pop back to previous screen
              },
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
