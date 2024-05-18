import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/constants/named_routes.dart';
import 'package:naukrified/base_features/features/full_page_job.dart';
import 'package:naukrified/base_features/features/widgets/custom_progress_indicator.dart';
import 'package:naukrified/base_features/features/widgets/jobs_card.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/base_features/themes/font_styles.dart';
import 'package:naukrified/tools.dart';

class RecommendedJobsScreen extends StatefulWidget {
  RecommendedJobsScreen({super.key, required this.list});
  List<JobModel> list;

  @override
  State<RecommendedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<RecommendedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recommended Jobs based on Your Profile',
          style: TextStyle(
            color: ColorStyles.darkTitleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorStyles.pureWhite,
      ),
      body: FutureBuilder(
        future: recommendJobs(widget.list),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return circularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                  "Facing Issues fetching the recommended jobs. Check if jobs are available or your resume profile is filled correcly."),
            );
          }
          return RecommendedJobs(
            jobs: snapshot.data!,
          );
        },
      ),
    );
    // },
    //   ),
    // );
  }
}

class RecommendedJobs extends StatefulWidget {
  RecommendedJobs({super.key, required this.jobs});
  List<JobModel> jobs;

  @override
  State<RecommendedJobs> createState() => _JosbAppliedWidgetState();
}

class _JosbAppliedWidgetState extends State<RecommendedJobs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: widget.jobs.length,
        itemBuilder: (context, index) {
          // if (controller.AppliedJobs.value
          //     .contains(jobs[index].id)) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => FullPageJob(jobModel: widget.jobs[index])));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(10, context),
                horizontal: scaleWidth(12, context),
              ),
              child: JobsCard(
                // companyName: jobs[index].companyName,
                // location: jobs[index].location,
                // thumbnail: jobs[index].thumbnail.toString(),
                // title: jobs[index].title,
                jobModel: widget.jobs[index],
                color: index % 2 == 0
                    ? ColorStyles.c5386E4
                    : const Color(0xFF3A5C99),
                // via: jobs[index].via,
                // extensions: jobs[index].extensions as List,
                // id: jobs[index].id,
              ),
            ),
          );
          // }
          // return Text('hi');
        },
      ),
    );
  }
}
