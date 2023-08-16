import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// 社區下拉選單
// 使用方式
// Demo 未使用
/*
    listViews.add(
      DropDownButton(
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.mainScreenAnimationController!,
                curve: const Interval((1 / (count * 2)) * 1, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.mainScreenAnimationController!,
      ),
    );
*/

class DropDownButton extends StatefulWidget {
  const DropDownButton(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  final List<String> genderItems = [
    // TODO: 由外部傳入
    '金櫻花園',
    '金櫻花廣場',
    '金櫻一品',
  ];

  String? selectedValue;

  @override
  void initState() {
    selectedValue = '金櫻花園';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23), // 左右padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  DropdownButtonFormField2<String>(
                    value: selectedValue,
                    isExpanded: true,
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      // Add more decoration..
                    ),
                    hint: const Text(
                      '請選擇社區',
                      style: TextStyle(fontSize: 16),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return '請選擇社區';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      //Do something when selected item is changed.
                      setState(() {
                        selectedValue = value.toString();
                      });
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 22),
                    ),
                  ),
                  const SizedBox(height: 1),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
