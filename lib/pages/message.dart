import 'package:chatapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: _Stories()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const _MessageTile(),
              childCount: 10, // Dummy message tiles
            ),
          ),
        ],
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 8, bottom: 16),
                child: Text(
                  'Stories',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return const _StoryCard(
                      name: 'John',
                      imageUrl: 'https://via.placeholder.com/150',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _StoryCard({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(height: 8),
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "User Name",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Last message goes here...",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "10:45 AM",
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  CircleAvatar(radius: 6, backgroundColor: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
