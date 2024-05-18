import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naukrified/base_features/atom/pill.dart';
import 'package:naukrified/base_features/constants/assets_location.dart';
import 'package:naukrified/base_features/constants/dimensions.dart';
import 'package:naukrified/base_features/constants/strings.dart';
import 'package:naukrified/base_features/features/widgets/vetical_space.dart';
import 'package:naukrified/base_features/firebase/jobs.dart';
import 'package:naukrified/base_features/models/jobs.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/themes/color_styles.dart';
import 'package:naukrified/main.dart';

class DisplayCard extends StatefulWidget {
  const DisplayCard({
    super.key,
    required this.job,
    required this.companyName,
    required this.location,
    required this.logo,
    required this.role,
    required this.salary,
    required this.color,
  });

  final String companyName;
  final String role;
  final String logo;
  final JobModel job;
  final String salary;
  final String location;
  final Color color;

  @override
  State<DisplayCard> createState() => _DisplayCardState();
}

class _DisplayCardState extends State<DisplayCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkSaved();
  }

  Future<void> checkSaved() async {
    try {
      final resp =
          await firestore.collection('jobsUser').doc(currentUser.email).get();

      if (resp.exists && resp.data() != null) {
        final savedJobs = resp.data()!['savedJobs'] as List<dynamic>;
        if (savedJobs.contains(widget.job.id)) {
          setState(() {
            isSaved = true;
          });
        } else {
          setState(() {
            isSaved = false;
          });
        }
      } else {
        setState(() {
          isSaved = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isSaved = false;
      });
    }
  }

  bool? isSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      padding: EdgeInsets.fromLTRB(
        scaleWidth(24, context),
        scaleHeight(24, context),
        scaleWidth(22, context),
        scaleHeight(20, context),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          scaleRadius(24, context),
        ),
        color: widget.color,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE AND DESCRIPTION
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(direction: Axis.horizontal, children: [
                    Text(
                      widget.role,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: ColorStyles.pureWhite,
                      ),
                    ),
                  ]),
                  VerticalSpace(value: 3, ctx: context),
                  Text(
                    widget.companyName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorStyles.pureWhite,
                    ),
                  ),
                ],
              ),
              // BOOKMARKS
              if (isSaved != null)
                IconButton(
                  icon: Icon(
                      isSaved == true ? Icons.bookmark_remove : Icons.bookmark),
                  onPressed: () async {
                    if (isSaved == false) {
                      print('hi');
                      final resp = await saveJob(widget.job);
                      if (resp) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Saved Successfully")));
                        setState(() {
                          isSaved = true;
                        });
                      }
                    }
                  },
                ),
            ],
          ),
          VerticalSpace(
            value: 24,
            ctx: context,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Pill(StaticText.it),
              Pill(StaticText.fullTime),
              Pill(StaticText.junior),
            ],
          ),
          VerticalSpace(
            value: 24,
            ctx: context,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.salary,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.pureWhite,
                ),
              ),
              Text(
                widget.location,
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
