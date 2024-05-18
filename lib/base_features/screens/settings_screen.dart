import 'package:flutter/material.dart';
import 'package:naukrified/base_features/Resume/form.dart';
import 'package:naukrified/base_features/Resume/resume_screen.dart';
import 'package:naukrified/base_features/models/chat/your_chats.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/profile/profile_preview.dart';
import 'package:naukrified/base_features/screens/saved_jobs.dart';
import 'package:naukrified/chatbot/chat_bot_screen.dart';
import 'package:naukrified/tools.dart';
import 'package:naukrified/trends/screens/trends.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      ProfilePreview(
        user: currentUser,
        showCallButton: false,
        showChatButton: false,
        showMailButton: false,
      ),
      // const CurrentUserTile(),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: shaderText(context,
      //       title: 'Other Features',
      //       style: Theme.of(context).textTheme.bodyLarge),
      // ),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        leading: const Icon(Icons.chat_outlined),
        title: const Text('Build your resume'),
        subtitle: const Text('Enter your details'),
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: () {
          navigatorPush(context, ResumeForm());
        },
      ),
      if (currentUser.templateData != null)
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          leading: const Icon(Icons.chat_outlined),
          title: const Text('Check your resume'),
          subtitle: const Text('Check your personalized resume'),
          tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          onTap: () {
            navigatorPush(
                context,
                ResumeScreen(
                  resumeType: "classic",
                  data: currentUser.templateData,
                ));
          },
        ),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        leading: const Icon(Icons.chat_outlined),
        title: const Text('Your Chats'),
        subtitle: const Text('View your all other chats here'),
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: () {
          navigatorPush(context, const ChatsScreen());
        },
      ),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        leading: const Icon(Icons.bookmark),
        title: const Text('Bookmarked Jobs'),
        subtitle: const Text('Checkout your bookmarked jobs'),
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: () {
          navigatorPush(context, SavedJobsScreen());
        },
      ),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        leading: const Icon(Icons.help),
        title: const Text('ChatBot Advice'),
        subtitle: const Text(
            'Get recommendations from ChatBot for your career choice'),
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: () {
          navigatorPush(context, ChatBotScreen());
        },
      ),
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        leading: const Icon(Icons.help),
        title: const Text('View Trends'),
        subtitle:
            const Text('Checkout the current Trends as per this platform'),
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        onTap: () {
          navigatorPush(context, TrendScreen());
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          // title: shaderText(
          //   context,
          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          //   title: 'Your Profile',
          // ),

          ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.separated(
                itemCount: children.length,
                separatorBuilder: (ctx, index) => const SizedBox(height: 5),
                itemBuilder: (ctx, index) => children[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
