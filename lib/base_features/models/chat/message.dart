import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:naukrified/main.dart';
import 'package:naukrified/base_features/models/users/user.dart';

import 'chat.dart';

class MessageData {
  /// The datetime object representing the
  late String id;

  /// The markdown text
  late String txt;

  /// Sender of the message
  late String from;

  /// CreatedAt
  late DateTime createdAt;

  /// Modified At
  DateTime? modifiedAt;

  /// Set of emails who have read this msg
  Set<String> readBy = {};

  /// These indicative messages are used to indicate
  /// that something has happened in the chat
  /// like the inclusion of someone in the chat
  /// can only be created but not deleted
  late bool indicative;

  /// This flag represents whether the msg is deleted or not?
  DateTime? deletedAt;

  MessageData({
    required this.id,
    required this.txt,
    required this.from,
    required this.createdAt,
    this.indicative = false,
    this.modifiedAt,
    this.deletedAt,
  });

  Map<String, dynamic> encode() {
    return {
      "txt": txt,
      "from": from,
      "indicative": indicative,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "deletedAt": deletedAt == null ? null : deletedAt!.millisecondsSinceEpoch,
      if (modifiedAt != null) "modifiedAt": modifiedAt!.millisecondsSinceEpoch,
      "readBy": readBy.toList()
    };
  }

  MessageData.load(this.id, Map<String, dynamic> data) {
    txt = data["txt"];
    from = data["from"];
    createdAt = DateTime.fromMillisecondsSinceEpoch(data["createdAt"]);
    deletedAt = data["deletedAt"] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(data["deletedAt"]!);
    indicative = data["indicative"] ?? false;
    modifiedAt = data["modifiedAt"] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(data["modifiedAt"]);
    readBy = ((data['readBy'] ?? []) as List<dynamic>)
        .map((e) => e.toString())
        .toSet();
  }
}

Future<void> addMeInReadBy(ChatData chat, MessageData msg) async {
  final chatMessages = firestore.doc(chat.path).collection("chat");
  await chatMessages
      .doc(msg.id)
      .update({'readBy': msg.readBy..add(currentUser!.email!)});
}

Future<MessageData?> fetchLastMessage(String path, {Source? src}) async {
  final response = await firestore
      .collection('$path/chat')
      .orderBy('createdAt', descending: true)
      .limit(1)
      .get(src == null ? null : GetOptions(source: src));
  for (final doc in response.docs) {
    return MessageData.load(doc.id, doc.data());
  }
  return null;
}

Future<void> addMessage(ChatData chat, MessageData msg) async {
  final chatMessages = firestore.doc(chat.path).collection("chat");
  await chatMessages
      .doc(DateTime.now().millisecondsSinceEpoch.toString())
      .set(msg.encode());
  // chat.receivers.map((e) => e).toList()
  //   ..add(chat.owner)
  //   ..forEach((email) async {
  //     // for now I'm also sending a notification to myself in debug mode
  //     if (email == currentUser.email && !kDebugMode) return;
  //     await sendNotification(
  //       toEmail: email,
  //       title: currentUser.name ?? currentUser.email,
  //       body: msg.txt,
  //       data: {
  //         'path': "${chat.path}/${msg.id}",
  //         'type': 'message',
  //       },
  //     );
  //   });
}

Future<void> deleteMessage(ChatData chat, MessageData msg) async {
  if (msg.deletedAt == null) {
    msg.deletedAt = DateTime.now();
  } else {
    msg.deletedAt = null;
  }
  final chatMessages = firestore.doc(chat.path).collection("chat");
  await chatMessages.doc(msg.id).update({
    'deletedAt':
        msg.deletedAt == null ? null : msg.deletedAt!.millisecondsSinceEpoch
  });
}
