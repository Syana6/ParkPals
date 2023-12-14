import 'package:flutter/material.dart';
import '../../enums/ParkingSpaceStatus.dart';
import 'notify_screen_detail.dart';

// 通知：顯示通知清單，清單項目以出粗車位為項目
class NotifyListItem {
  String rentSpace;
  String avatarUrl;
  String title;
  String latestMessage;
  int unreadCount; // 訊息數量
  ParkingSpaceStatus status;
  String createTime;

  NotifyListItem({
    required this.rentSpace,
    required this.avatarUrl,
    required this.title,
    required this.latestMessage,
    required this.unreadCount,
    required this.status,
    required this.createTime,
  });
}

class NotifyScreen extends StatelessWidget {
  final List<NotifyListItem> notifyList = [
    NotifyListItem(
      rentSpace:'B1-22',
      avatarUrl: 'https://example.com/avatar1.png',
      title: '1 號車位',
      latestMessage: 'Hello there!',
      status:ParkingSpaceStatus.rented,
      unreadCount: 13,
      createTime: '10:30 AM',
    ),
    NotifyListItem(
      rentSpace:'B4-373',
      avatarUrl: 'https://example.com/avatar2.png',
      title: '2 號車位',
      latestMessage: 'How are you?',
      status: ParkingSpaceStatus.available,
      unreadCount: 0,
      createTime: '10:45 AM',
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
        itemCount: notifyList.length,
        itemBuilder: (context, index) {
          return NotifyListItemWidget(notify: notifyList[index]);
        },
      ),
    );
  }
}

class NotifyListItemWidget extends StatelessWidget {
  final NotifyListItem notify;

  NotifyListItemWidget({required this.notify});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(notify.avatarUrl),
      ),
      title: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: CustomPaint(
                      painter: DotPainter(
                        color: notify.status == ParkingSpaceStatus.rented ? 
                            Colors.red : 
                              (notify.status == ParkingSpaceStatus.available ? Colors.green : Colors.black54),
                        radius: 9.0,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: notify.title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.3, // 設置文本之間的間距
                    ),
                  ),
                ],
              ),
            ),
          ),
          notify.unreadCount > 0
              ? Container(
                  margin: const EdgeInsets.only(left: 8.0),
                  child: CustomPaint(
                    painter: DotPainter(
                      color: Color.fromARGB(255, 46, 188, 48),
                      radius: 10.0,
                    ),
                    child: Center(
                      child: Text(
                        '${notify.unreadCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.3,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(width: 40),
        ],
      ),
      subtitle: Expanded(
        child: Row(children: [
          Expanded(
            child: Text(
              notify.latestMessage,
              style: const TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Text(
            notify.createTime,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5,
              fontSize: 11.0,
            ),
          ),
        ]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotifyScreenDetail(rentSpace: notify.rentSpace, status: notify.status),
          ),
        );
      },
    );
  }
}

// 繪製紅色小點
class DotPainter extends CustomPainter {
  final Color color;
  final double radius;

  DotPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
