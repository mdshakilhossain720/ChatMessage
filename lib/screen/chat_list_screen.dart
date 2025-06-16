import 'package:chatapp/app_color.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chat List',
              style: TextStyle(color: AppColor.text, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
