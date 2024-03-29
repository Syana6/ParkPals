import 'package:ej_selector/ej_selector.dart';
import 'package:flutter/material.dart';
import 'package:parkpals/toRentView/to_rent_screen_theme.dart';

// 選單按鈕 彈出MessageBox
class SelectItemMsgBox extends StatelessWidget {
  SelectItemMsgBox({super.key});

  @override
  Widget build(BuildContext context) {
    return EJSelectorButton<ItemModel>(
      useValue: false,
      // 初始顯示按鈕Widget
      hint: const Icon(Icons.sort, size: 42, color: RentScreenTheme.primaryColor),
      // hint: const Text(
      //   'Click to choose',
      //   style: TextStyle(fontSize: 16, color: Colors.black),
      // ),
      buttonBuilder: (child, value) => Container(
        alignment: Alignment.centerLeft,
        height: 58,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.transparent,
        ),
        // 選擇Item後要用什麼Widget替換
        child: const Icon(Icons.sort, size: 42, color: RentScreenTheme.primaryColor),
        // child: value != null
        //     ? Text(
        //         value.name,
        //         style: const TextStyle(fontSize: 16, color: Colors.black),
        //       )
        //     : child,
      ),
      // Item被選擇後的事件
      selectedWidgetBuilder: (valueOfSelected) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Text(
          valueOfSelected.name,
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
      items: items
          .map(
            (item) => EJSelectorItem(
              value: item,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  final items = <ItemModel>[
    ItemModel(1, '金櫻花園'),
    ItemModel(2, '廣場花園'),
    ItemModel(3, '喬巴社區'),
    ItemModel(4, '金櫻鎮'),
    ItemModel(5, '金櫻一品'),
  ];
}

class ItemModel {
  ItemModel(this.id, this.name);

  final int id;
  final String name;
}
