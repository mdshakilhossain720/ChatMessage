import 'package:chatapp/theme.dart';
import 'package:chatapp/widgets/icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart'
    show Message;

class ChatScreen extends StatefulWidget {
  // static Route routeWithChannel(Message data) => MaterialPageRoute(
  //     builder: (context) => ChatScreen(
  //       message: data,

  //     ),
  //   );
  const ChatScreen({super.key});
  // final Message message;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: CupertinoIcons.back,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: AppBarTitle(
          channelName: 'Flutter Devs',
          imageUrl: 'https://example.com/avatar.jpg',
          statusText: 'Online',
          statusColor: Colors.green,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: CupertinoIcons.video_camera_solid,
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: IconBorder(icon: CupertinoIcons.phone_solid, onTap: () {}),
            ),
          ),
        ],
      ),
      body: Column(children: [Expanded(child: DemoMessageList())]),
    );
  }
}

class DemoMessageList extends StatelessWidget {
  const DemoMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DateLable(label: 'Yesterday'),
        _MessageTile(message: Message(text: 'Hello'), messagedata: 'Hello'),
      ],
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    super.key,
    required this.message,
    required this.messagedata,
  });

  final Message message;
  final String messagedata;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 20,
                ),
                child: Text(message.text ?? ''),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                '10:45 AM',
                style: TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({super.key, required this.message});

  final Message message;

  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                  bottomLeft: Radius.circular(_borderRadius),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 20,
                ),
                child: Text(
                  message.text ?? '',
                  style: const TextStyle(color: AppColors.textLigth),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                '10:45 AM',
                style: TextStyle(
                  color: AppColors.textFaded,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String channelName;
  final String imageUrl;
  final String statusText;
  final Color statusColor;

  const AppBarTitle({
    super.key,
    required this.channelName,
    required this.imageUrl,
    required this.statusText,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 16, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                channelName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                statusText,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DateLable extends StatefulWidget {
  const _DateLable({super.key, required this.label});

  final String label;

  @override
  __DateLableState createState() => __DateLableState();
}

class __DateLableState extends State<_DateLable> {
  late String dayInfo;

  // @override
  // void initState() {
  //   final createdAt = Jiffy(widget.dateTime);
  //   final now = DateTime.now();

  //   if (Jiffy(createdAt).isSame(now, Units.DAY)) {
  //     dayInfo = 'TODAY';
  //   } else if (Jiffy(createdAt)
  //       .isSame(now.subtract(const Duration(days: 1)), Units.DAY)) {
  //     dayInfo = 'YESTERDAY';
  //   } else if (Jiffy(createdAt).isAfter(
  //     now.subtract(const Duration(days: 7)),
  //     Units.DAY,
  //   )) {
  //     dayInfo = createdAt.EEEE;
  //   } else if (Jiffy(createdAt).isAfter(
  //     Jiffy(now).subtract(years: 1),
  //     Units.DAY,
  //   )) {
  //     dayInfo = createdAt.MMMd;
  //   } else {
  //     dayInfo = createdAt.MMMd;
  //   }

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
            child: Text(
              dayInfo,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textFaded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
