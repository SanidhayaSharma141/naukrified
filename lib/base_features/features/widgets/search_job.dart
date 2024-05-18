import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/Jobs/add_job_screen.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/features/full_page_job.dart';
import 'package:naukrified/base_features/features/widgets/horizontal_space.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/chat/chat.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/sample_data.dart';
import 'package:naukrified/base_features/screens/chat/chat_screen.dart';
import 'package:naukrified/base_features/screens/view_all_jobs.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/roles_data_analysis.dart/firebase/data_fetch.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/job_analysis.dart';
import 'package:naukrified/trends/firebase/trends.dart';

class SearchJob extends StatefulWidget {
  SearchJob({super.key, required this.list});
  List<JobModel> list;

  @override
  State<SearchJob> createState() => _SearchJobState();
}

class _SearchJobState extends State<SearchJob> {
  List<JobModel> filterJobs(String text) {
    return widget.list
        .where((job) => job.title.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(widget.list);
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 64,
            child: TextField(
              cursorColor: ColorStyles.darkTitleColor,
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(24, context),
                    vertical: scaleHeight(14, context),
                  ),
                  child: SvgPicture.asset(
                    Assets.search,
                  ),
                ),
                hintText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(
                    color: ColorStyles.darkTitleColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                  borderSide: const BorderSide(color: ColorStyles.f2f2f3),
                ),
                filled: true,
                fillColor: ColorStyles.f2f2f3,
              ),
            ),
          ),
        ),
        HorizontalSpace(value: 16, ctx: context),
        InkWell(
          onTap: () async {
            final jobs = filterJobs(_controller.text);
            print(jobs);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ViewAllJobs(
                      list: jobs,
                    )));
            // for (final x in job1) {
            //   await uploadJobRole(jobRole: x);
            // await postData();
            // }
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (_) => ChatScreen(
            //           chat: ChatData(
            //               owner: "", path: "", receivers: [], title: "Job"),
            //         )));
            // await uploadJobRole(jobRole: jobRoleInstance);
          },
          child: Icon(Icons.forward),
        ),
      ],
    );
  }
}
