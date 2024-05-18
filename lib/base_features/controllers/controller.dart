import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naukrified/base_features/Jobs/add_job_screen.dart';
import 'package:naukrified/base_features/Resume/settings_screen.dart';
import 'package:naukrified/base_features/features/applied_jobs_screen.dart';
import 'package:naukrified/base_features/features/auth/presentation/screens/notification_screen.dart';
import 'package:naukrified/base_features/features/widgets/job_details_card.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/settings_screen.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/roles_data_analysis.dart/modal/job_role.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/job_analysis.dart';
import 'package:naukrified/roles_data_analysis.dart/screens/view_job_roles.dart';

import '../features/home/home_screen.dart';
import '../features/messages/messages_screen.dart';

class Controller extends GetxController {
  final RxInt _currentIndex = 0.obs;
  final List<Widget> _tabs = [
    const HomeScreen(),
    // const MessagesScreen(),
    ViewJobRolesScreen(),
    currentUser.accountType == "Applicant"
        ? AppliedJobsScreen(
            isApplied: true,
          )
        : AppliedJobsScreen(isApplied: false),
    currentUser.accountType == "Applicant"
        ? NotificationScreen()
        : AddJobScreen(),
    const SettingsScreen()
  ];

  final RxInt _tabController = 0.obs;

  Widget switchScreen() {
    return _tabs[_currentIndex.value];
  }

  // ignore: avoid_setters_without_getters
  set switchTab(int index) {
    _tabController.value = index;
  }

  int get currentIndex {
    return _currentIndex.value;
  }

  int get tabController {
    return _tabController.value;
  }

  set currentIndex(int index) {
    _currentIndex.value = index;
  }

  set tabController(int index) {
    _tabController.value = index;
  }
}
