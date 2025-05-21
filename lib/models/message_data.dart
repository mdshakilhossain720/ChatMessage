import 'package:flutter/material.dart';

@immutable
class MessageData {
  final String message;
  final String senderNamer;
  final String dateMessage;
  final DateTime messagedate;
  final String profilePicture;

  const MessageData({
    required this.message,
    required this.senderNamer,
    required this.dateMessage,
    required this.messagedate,
    required this.profilePicture,
  });
}
