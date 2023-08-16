import 'package:ej_selector/ej_selector.dart';
import 'package:flutter/material.dart';
import 'package:parkpals/rentView/rent_screen_theme.dart';

// 選單按鈕 彈出MessageBox
class SelectItemMsgBox extends StatelessWidget {
  SelectItemMsgBox({super.key});

  @override
  Widget build(BuildContext context) {
    return EJSelectorButton<ItemModel>(
      useValue: false,
      hint: const Icon(Icons.sort,
          size: 42, color: RentScreenTheme.primaryColor),
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
        child: value != null
            ? Text(
                value.name,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              )
            : child,
      ),
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
    ItemModel(1, 'First Item'),
    ItemModel(2, 'Second Item'),
    ItemModel(3, 'Third Item'),
    ItemModel(4, 'Forth Item'),
    ItemModel(5, 'Fifth Item'),
  ];
}

class ItemModel {
  ItemModel(this.id, this.name);

  final int id;
  final String name;
}
