import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget是一個無狀態的Widget，用於構建不需要在應用程序生命週期中保持狀態的場景中，
// 一旦構建完成就不能被修改。
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 這個 Widget 是應用程式的根組件，即所有其他的 Widget 都是它的子 Widget。它負責渲染整個應用程式的畫面。
  // 在整個應用程式中只會被實例化一次，並且是其他 Widget 的共同父級。在設計應用程式時，通常會在這個 Widget 中定義應用程式的全局變數和配置。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 應用程式的主題（theme），用來定義應用程式的整體外觀和樣式，例如標題欄和背景色等。
        // 將 primarySwatch 改為 Colors.green是示範如何在應用程式運行時動態更改主題設定。
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page 1'),
    );
  }
}

// StatefulWidget是一個有狀態的Widget，用於生命週期狀態保持、
// 負責創建、繪製和構建Widget。
// 當使用StatefulWidget時，通常需要重寫其State類的build方法。
// 當狀態改變時，Flutter框架會自動調用State對象的build方法，重新構建Widget，以反映新的狀態。
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // State 物件是 Widget 的配置檔，它包含一些由父 Widget（即 App Widget）提供的值（在這個例子中是title），
  // 並且這些值會被用於 State 的 build 方法中。
  // 在 Widget 的子類中，所有的欄位都必須標記為 "final"，表示一旦被賦值後就不能再改變了。
  final String title;

  @override
  // 負責維護Widget的狀態、重繪和更新。
  State<MyHomePage> createState() => _MyHomePageState();
}

// 首頁建構_incrementCounter方法
// 表頭、Body、ActionButton在最底下
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 這個方法是調用了 Flutter 框架的 setState 方法，用於告訴框架該 State 發生了變化，
      // 需要重新執行下方的 build 方法，這樣顯示就可以反映出更新後的值。
      // 如果我們改變了 _counter 變數的值，但沒有調用 setState() 方法，則 build 方法將不會重新執行，所以顯示上就看不到任何變化。
      _counter++;
    });
  }
    void _decrementCounter() {
    setState(() {
      // 這個方法是調用了 Flutter 框架的 setState 方法，用於告訴框架該 State 發生了變化，
      // 需要重新執行下方的 build 方法，這樣顯示就可以反映出更新後的值。
      // 如果我們改變了 _counter 變數的值，但沒有調用 setState() 方法，則 build 方法將不會重新執行，所以顯示上就看不到任何變化。
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
      // 這個方法會在每次調用 setState() 方法時被重新執行，
      // 例如在 _incrementCounter 方法中。在這個方法中，會重新定義 Widget 的結構和樣式，以便反映出最新的狀態。

      
    return Scaffold(
      appBar: AppBar(
        // 設置 AppBar 的標題文字，標題文字的內容是 MyHomePage 物件的一個屬性，由 App.build 方法創建。
        title: Text(widget.title),
      ),
      body: Center(
        // Center 是一個佈局（layout）Widget，它用於將其單一的子 Widget 居中放置在父 Widget 中。
        child: Column(
          // 預設情況下，Column 的寬度會自適應子 Widget 的寬度，並且會盡可能地填滿父 Widget 的高度。
          // Widget 垂直居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times b:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // DefaultTabController(
            //   length: tabList.length,
            //   child: Scaffold(
            //     appBar: TabBar(
            //       tabs: tabList.map((choice) {
            //         return Tab(
            //           text: choice.title,
            //           icon: Icon(choice.icon),
            //         );
            //       }).toList(),
            //     ),
            //     body: TabBarView(
            //       children: tabList.map((choice) {
            //       return Center(
            //         child: Icon(
            //           choice.icon,
            //           size: 100.0,
            //         ),
            //       );
            //     }).toList()),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;
  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = <TabChoice>[
  TabChoice('Happy', Icons.mood),
  TabChoice('Sad', Icons.mood_bad),
];