import 'package:flutter/material.dart';

// 通知細項：顯示指定的車位通知訊息
class ChatListItem {
  String avatarUrl;
  String message;
  String time;

  ChatListItem({
    required this.avatarUrl,
    required this.message,
    required this.time,
  });
}

class NotifyScreenDetail extends StatelessWidget {
  final List<ChatListItem> chatList = [
    ChatListItem(
      avatarUrl: 'https://example.com/avatar1.png',
      message: '租借成功',
      time: '10:30 AM',
    ),
    ChatListItem(
      avatarUrl: 'https://example.com/avatar2.png',
      message: 'How are you?',
      time: '11:45 AM',
    ),
    // Add more chat items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chatList[index].avatarUrl),
              ),
              title: Text(chatList[index].message),
              subtitle: Text(chatList[index].time),
              onTap: () {
                // Handle chat item tap
              },
            ),
          );
        },
      ),
    );
  }
}
