import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

// 時間日期選擇器 // Demo 未使用
class SelectDateView extends StatefulWidget {
  const SelectDateView({super.key});

  @override
  _SelectDateViewState createState() => _SelectDateViewState();
}

class _SelectDateViewState extends State<SelectDateView> {
  List<DateTime>? _selectedDate;
  String? _textDate;
  final TextEditingController _textDateController = TextEditingController();

  @override
  void dispose() {
    _textDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 220),
            // color: Colors.blue,
            child: TextFormField(
              controller: _textDateController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: '想借什麼時候?',
                hintStyle: const TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    showDatetimePicker();
                  },
                  icon: const Icon(Icons.access_time),
                ),
              ),
              readOnly: true,
            ),
          ),
        ),
      ),
    );
  }

  // 處理時間文字內容
  void showSelectedText() {
    if (_selectedDate?[1].minute == null) {
      _textDateController.text = '';
      return;
    } else if ((_selectedDate![1].minute % 10) > 0) {
      _textDateController.text = '';
      return;
    }

    _textDate =
        '${_selectedDate?[0].year}/${_selectedDate?[0].month}/${_selectedDate?[0].day} '
        '${_selectedDate?[0].hour}:${_selectedDate?[0].minute}~'
        '${_selectedDate?[1].month}/${_selectedDate?[1].day} '
        '${_selectedDate?[1].hour}:${_selectedDate?[1].minute}';

    _textDateController.text = _textDate!;
    print(_textDate);
  }

  // 建構時間選擇器的內容
  void showDatetimePicker() async {
    _selectedDate = await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: DateTime.now(),
      startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      startLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      endInitialDate: DateTime.now(),
      endFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
      endLastDate: DateTime.now().add(
        const Duration(days: 3652),
      ),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 10,
      secondsInterval: 600,
      isForce2Digits: true,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      constraints: const BoxConstraints(
        maxWidth: 350,
        maxHeight: 650,
      ),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1.drive(
            Tween(
              begin: 0,
              end: 1,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      selectableDayPredicate: (dateTime) {
        // Disable 25th Feb 2023
        if (dateTime == DateTime(2023, 2, 25)) {
          return false;
        } else {
          return true;
        }
      },
    );
    // print("Start dateTime: ${_selectedDate?[0]}");
    // print("End dateTime: ${_selectedDate?[1]}");

    // 選完後更新畫面時間文字
    setState(() {
      showSelectedText();
    });
  }
}
