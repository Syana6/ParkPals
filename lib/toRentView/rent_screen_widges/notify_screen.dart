import 'package:flutter/material.dart';
import 'notify_screen_detail.dart';

// 通知：顯示通知清單，清單項目以出粗車位為項目
class ChatListItem {
  String avatarUrl;
  String title;
  String latestMessage;
  int unreadCount;
  String time;

  ChatListItem({
    required this.avatarUrl,
    required this.title,
    required this.latestMessage,
    required this.unreadCount,
    required this.time,
  });
}

class NotifyScreen extends StatelessWidget {
  final List<ChatListItem> chatList = [
    ChatListItem(
      avatarUrl: 'https://example.com/avatar1.png',
      title: '1 號車位',
      latestMessage: 'Hello there!',
      unreadCount: 13,
      time: '10:30 AM',
    ),
    ChatListItem(
      avatarUrl: 'https://example.com/avatar2.png',
      title: '2 號車位',
      latestMessage: 'How are you?',
      unreadCount: 0,
      time: '10:45 AM',
    ),
    // Add more chat items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('通知'),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ChatListItemWidget(chatItem: chatList[index]);
        },
      ),
    );
  }
}

class ChatListItemWidget extends StatelessWidget {
  final ChatListItem chatItem;

  ChatListItemWidget({required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chatItem.avatarUrl),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(chatItem.title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3, // 設置文本之間的間距
                )),
          ),
          chatItem.unreadCount > 0 // 如果有訊息的話顯示紅色數字
              ? Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 46, 188, 48),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('${chatItem.unreadCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1.3, // 設置文本之間的間距
                        fontSize: 12.0, // 設置字體大小
                      )),
                )
              : const SizedBox(width: 40),
        ],
      ),
      subtitle: Expanded(
        child: Row(children: [
          Expanded(
            child: Text(chatItem.latestMessage,
                style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5, // 設置文本之間的間距
                )),
          ),
          Text(
            chatItem.time,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5, // 設置文本之間的間距
              fontSize: 11.0, // 設置字體大小
            ),
          ),
        ]),
      ),
      onTap: () {
        // 在點擊時導航到通知明細
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotifyScreenDetail(),
          ),
        );
      },
    );
  }
}
