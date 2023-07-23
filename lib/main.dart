import 'package:flutter/material.dart';
import 'package:parkpals/rentView/canRent.dart';
import 'forRentView/parkingCommunity.dart';

void main() {
  runApp(const ParkPALsApp());
}

class ParkPALsApp extends StatelessWidget {
  const ParkPALsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '社區車位租借',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // todo: 這裡要改成登入頁面
      home: const HomePage(title: '{社區名稱} - 社區停車位租借友善互助系統'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // 預設
  final PageController _pageController = PageController(initialPage: 1); // match with initial index

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    // update index and rebuild widgets
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView(
          controller: _pageController,
          children: const [
            parkingCommunity(title: '我上架的車位'),
            canRent(title: '可租借車位'),
            // Add your 3rd page here
          ],
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: '出借',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_downward),
            label: '租借',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '帳號',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
