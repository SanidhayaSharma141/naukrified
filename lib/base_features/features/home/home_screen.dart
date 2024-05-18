import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/features/auth/data/controllers/auth_functions.dart';
import 'package:naukrified/base_features/features/full_page_job.dart';
import 'package:naukrified/base_features/features/widgets/custom_progress_indicator.dart';
import 'package:naukrified/base_features/features/widgets/featured_jobs_tile.dart';
import 'package:naukrified/base_features/features/widgets/display_card.dart';
import 'package:naukrified/base_features/features/widgets/horizontal_space.dart';
import 'package:naukrified/base_features/features/widgets/popular_jobs_card.dart';
import 'package:naukrified/base_features/features/widgets/profile_header.dart';
import 'package:naukrified/base_features/features/widgets/search_job.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/recommended_jobs.dart';
import 'package:naukrified/base_features/screens/view_all_jobs.dart';

import '../../themes/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<JobModel> list = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getJobs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomProgressIndicator();
            }
            if (!snapshot.hasData) {
              return HomeScreenWidget(list: []);
            }
            list = snapshot.data!; // Update the list here
            list.shuffle();
            return HomeScreenWidget(list: list);
          },
        ),
      ),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  HomeScreenWidget({super.key, required this.list});
  List<JobModel> list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(24, context),
              vertical: scaleHeight(28, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileHeader(
                      lightWelcomeText: "Lets get naukrified,",
                      boldWelcomeText: currentUser.name ?? "User",
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: 'Sign out',
                          middleText: 'Do you really want to sign out?',
                          textCancel: 'No',
                          textConfirm: 'Yes',
                          confirmTextColor: ColorStyles.pureWhite,
                          onConfirm: () {
                            AuthFunctions.signOutUser(context);
                          },
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: currentUser.imgUrl == null
                            ? null
                            : CachedNetworkImageProvider(currentUser.imgUrl!),
                        radius: 50,
                        child: currentUser.imgUrl != null
                            ? null
                            : const Icon(
                                Icons.person_rounded,
                                size: 50,
                              ),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(value: 39, ctx: context),
                if (list.isNotEmpty)
                  SearchJob(
                    list: list,
                  ),
                VerticalSpace(value: 40, ctx: context),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ViewAllJobs(
                              list: list,
                            )));
                  },
                  child: const FeaturedJobsTile(
                    mainText: StaticText.featuredJobs,
                    text: StaticText.seeAll,
                  ),
                ),
              ],
            ),
          ),
          HorizontalSpace(value: 20, ctx: context),

          // JOBS CARD
          SizedBox(
            height: scaleHeight(220, context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length, // Use list length here
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: scaleWidth(24, context)),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => FullPageJob(
                              jobModel: list[index],
                            ))),
                    child: DisplayCard(
                      job: list[index],
                      companyName: list[index].companyName,
                      role: list[index].title,
                      salary: "₹ ${list[index].salary}",
                      location: list[index].location,
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.6),
                      logo: list[index].thumbnail,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              scaleWidth(24, context),
              scaleHeight(42, context),
              scaleWidth(24, context),
              scaleHeight(16, context),
            ),

            // RECOMMENDED JOBS
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => RecommendedJobsScreen(
                              list: list,
                            )));
                  },
                  child: FeaturedJobsTile(
                    mainText: "Recommended Jobs",
                    text: StaticText.seeAll,
                  ),
                ),
                VerticalSpace(
                  value: 20,
                  ctx: context,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopularJobsCard(
                      logo: Assets.googleSvg,
                      company: StaticText.google,
                      role: 'SDE',
                      salary: '\INR 180,000/y',
                      color: ColorStyles.cFFEBF3,
                    ),
                    PopularJobsCard(
                      logo: Assets.facebookSvg,
                      company: StaticText.facebook,
                      role: 'CEO',
                      salary: '\INR 110,000/y',
                      color: ColorStyles.cEBF1FF,
                    ),
                  ],
                ),
              ],
            ),

            // POPULAR JOBS CARD
          ),
        ],
      ),
    );
  }
}
