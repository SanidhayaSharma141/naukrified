import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:naukrified/base_features/atom/pill.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/features/widgets/horizontal_space.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import '../../controllers/controller.dart';

class JobsCard extends StatelessWidget {
  const JobsCard({
    super.key,
    required this.color,
    required this.jobModel,
  });

  final Color color;
  final JobModel jobModel;

  @override
  Widget build(BuildContext context) {
    const List<String> pillRandom = ["Security", "Safety"];
    final List<dynamic> extensionsList = jobModel.extensions as List<dynamic>;

    final Controller tabSwitchController = Get.find();
    return Container(
      padding: EdgeInsets.fromLTRB(
        scaleWidth(22, context),
        scaleHeight(24, context),
        scaleWidth(22, context),
        scaleHeight(20, context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          scaleRadius(24, context),
        ),
        color: color,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // COMPANY thumbnail
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: BoxDecoration(
                  color: ColorStyles.pureWhite,
                  borderRadius: BorderRadius.circular(
                    scaleRadius(12, context),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(4, context),
                  vertical: scaleHeight(4, context),
                ),
                child: SvgPicture.asset(Assets.browseYourJob,
                    colorFilter: const ColorFilter.mode(
                      ColorStyles.defaultMainColor,
                      BlendMode.srcIn,
                    )),
              ),
              HorizontalSpace(value: 4, ctx: context),
              // TITLE AND DESCRIPTION
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobModel.title.toString().length < 20
                        ? jobModel.title.toString()
                        : '${jobModel.title.toString().substring(0, 20)}...',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ColorStyles.pureWhite,
                    ),
                  ),
                  VerticalSpace(value: 3, ctx: context),
                  Text(
                    jobModel.companyName.toString().length < 22
                        ? jobModel.companyName.toString()
                        : '${jobModel.companyName.toString().substring(0, 22)}...',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.pureWhite,
                    ),
                  ),
                ],
              ),
              HorizontalSpace(value: 4, ctx: context),
              GestureDetector(
                  onTap: () {
                    // controller.updateSavedJobs(jobModel);
                    // tabSwitchController.currentIndex =
                    //     tabSwitchController.currentIndex == 3 ? 2 : 3;
                    // tabSwitchController.switchScreen();
                  },
                  child: const Icon(
                    Icons.check_circle,
                    color: ColorStyles.pureWhite,
                  )),
              // },
              // ),
            ],
          ),
          VerticalSpace(
            value: 40,
            ctx: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 3; i++) ...{
                if (i >= extensionsList.length ||
                    extensionsList[i].toString().length > 12) ...{
                  Pill(pillRandom[Random().nextInt(2)]),
                  HorizontalSpace(value: 4, ctx: context),
                } else ...{
                  Pill(extensionsList[i] as String),
                  HorizontalSpace(value: 4, ctx: context),
                }
              }
            ],
          ),
          VerticalSpace(
            value: 40,
            ctx: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobModel.via.toString().length < 20
                    ? jobModel.via.toString()
                    : '${jobModel.via.toString().substring(0, 20)}...',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.pureWhite,
                ),
              ),
              Text(
                jobModel.location.toString().length < 20
                    ? jobModel.location.toString()
                    : '${jobModel.location.toString().substring(0, 20)}...',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.pureWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
