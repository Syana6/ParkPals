import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkpals/rent/cantRentPage.dart';

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
      home: const HomePage(title: '金鶯後花園 - 社區停車位租借友善互助系統'),
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
  int _selectedIndex = 1; // 預設是租借

  @override
  void dispose() {
    super.dispose();
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // TODO: 根據選擇的按鈕改變頁面
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: canRentPage(title: '可租借車位'),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}