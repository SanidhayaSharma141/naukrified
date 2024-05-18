import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/base_features/models/chat/message.dart';
import 'package:naukrified/base_features/models/users/user.dart';
import 'package:naukrified/base_features/screens/chat/chat_screen.dart';
import 'package:naukrified/tools.dart';

class ChatData {
  String title;
  String? description;
  List<String> receivers;
  String owner;

  /// the path where chat collection is present
  String path;
  List<MessageData> messages = [];

  /// Whether the chat is locked
  bool locked = false;

  ChatData({
    required this.owner,
    required this.receivers,
    this.description,
    required this.title,
    required this.path,
    this.locked = false,
  });
}

Future<ChatData> fetchChatData(ChatData chat) async {
  final response = await firestore.collection("${chat.path}/chat").get();
  chat.messages =
      response.docs.map((e) => MessageData.load(e.id, e.data())).toList();
  return chat;
}

showChat(
  BuildContext context, {
  required String id,
  required List<String> emails,
}) {
  return navigatorPush(
    context,
    ChatScreen(
      chat: ChatData(
        owner: currentUser!.email!,
        receivers: emails,
        title: id,
        path: 'chats/$id',
      ),
    ),
  );
}
