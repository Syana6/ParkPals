import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: const Text('設定', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 用户信息
            _buildUserInfo(),

            // 註冊/登入
            _buildRegisterLogin(),

            // 常用功能
            _buildSectionTitle('常用功能'),
            _buildButtonsRow(['我的車號', '朋友車號']),
            _buildButtonsRow(['社區黑名單', '']),
            _buildButtonsRow(['', ]),

            // 更多功能
            _buildSectionTitle('更多功能(訂閱)'),
            _buildButtonsRow(['封鎖名單', '']),
            _buildButtonsRow(['功能9', '功能10']),
            _buildButtonsRow(['功能11', '功能12']),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    bool isLoggedIn = true; // Replace with your login logic
    String userName = isLoggedIn ? 'John Doe' : '訪客';

    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        userName,
        style: const TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // 註冊/登入 按鈕
  Widget _buildRegisterLogin() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '點擊註冊/登入',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle registration/login button click
              },
              style: ElevatedButton.styleFrom(
                elevation: 20,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('註冊/登入'),
            ),
          ],
        ));
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  // 其它功能按鈕排列
  Widget _buildButtonsRow(List<String> buttonLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 10.0),
        if (buttonLabels.isNotEmpty) _buildButton(buttonLabels[0]),
        const SizedBox(width: 20.0),
        if (buttonLabels.length > 1) _buildButton(buttonLabels[1]),
      ],
    );
  }

  // 其它功能按鈕
  Widget _buildButton(String label) {
    return Container(
      width: 180.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle button click
        },
        style: ElevatedButton.styleFrom(
          elevation: 20,
          backgroundColor: const Color.fromARGB(255, 66, 61, 61),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.star,size: 20, color: Colors.yellowAccent), // Replace with your icon
            const SizedBox(width: 8.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}
