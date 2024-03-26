import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import '../../common/dateTimeHelper.dart';

// 用時間選擇器的_selectedTime 進行計算
enum timeDiffType {
  getDateDiff, // 顯示日期區間 e.g. 11/01~11/03
  getTimeDiff, // 顯示時間區間 e.g. 19:30~20:00
  getHoursDiff, // 顯示總小時數 e.g. 0.5
}

// 上架中車位資訊編輯
// 進入編輯中的車位必須要從可租借移除，否則租借的人租借當下可能顯示舊的資訊
class AvailableParkingSpacesEdit extends StatefulWidget {
  final String community; // 社區
  final String spaces; // 車位
  final String availableID; // 出租ID

  @override
  _AvailableParkingSpacesEditState createState() =>
      _AvailableParkingSpacesEditState();

  AvailableParkingSpacesEdit(
      {Key? key,
      required this.community,
      required this.spaces,
      required this.availableID})
      : super(key: key);
}

class _AvailableParkingSpacesEditState
    extends State<AvailableParkingSpacesEdit> {
  List<DateTime>? _selectedDate;
  DateTime _selectedTime = DateTime.now(); // 時間選擇器選擇的時間
  String _startTime = ""; // 選擇的出借開始時間
  String _endTime = ""; // 選擇的出借結束時間
  double _hourlyRate = 0.0; // 每小時出借金額

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${widget.community}  ${widget.spaces}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Text(
                      '設定出借時間:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '總計: \$${_hourlyRate * 2 * calculateHourDifference(_startTime, _endTime)}', // 顯示計算結果
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Stack(children: [
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            calculateDateInfo(timeDiffType.getTimeDiff),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Positioned(
                          top: -3, // 調整垂直位置，使第一個 Text 稍高於第二個 Text
                          child: Text(
                              calculateDateInfo(timeDiffType.getDateDiff),
                              style: TextStyle(fontSize: 14)),
                        ),
                      ]),
                      Expanded(
                        child: Text(
                          calculateDateInfo(timeDiffType.getHoursDiff),
                          style: const TextStyle(fontSize: 15),
                          textAlign: TextAlign.right, // 對齊到最右邊
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                    decoration: const InputDecoration(
                      labelText: '每半小時金額',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: '請輸入每小時出借金額',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _hourlyRate = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Save settings
                          print('Date: $_selectedDate');
                          print('Time: $_selectedTime');
                          print('Hourly Rate: $_hourlyRate');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('確定', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 時間選擇器 年/月/日
  void _selectDate(BuildContext context) async {
    final List<DateTime>? pickedDate = await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate:
        _selectedDate == null ? getNextValidTime(DateTime.now().add(const Duration(minutes: 30))) : _selectedDate![0],
      endInitialDate:
        _selectedDate == null ? getNextValidTime(DateTime.now().add(const Duration(minutes: 90))) : _selectedDate![1],
      // 開始最早與最晚可設定日期
      startFirstDate: getNextValidTime(DateTime.now().add(const Duration(days: 0))),
      startLastDate: getNextValidTime(DateTime.now().add(const Duration(days: 6))),
      // 結束最早與最晚可設定日期
      endFirstDate: getNextValidTime(DateTime.now().add(const Duration(days: 0))),
      endLastDate: getNextValidTime(DateTime.now().add(const Duration(days: 7))),
      is24HourMode: true,
      isShowSeconds: false,
      minutesInterval: 30,
      secondsInterval: 60,
      isForce2Digits: true,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _startTime =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDate![0]);
        _endTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDate![1]);
      });
    }
  }

  // 處理本頁的顯示邏輯
  String calculateDateInfo(timeDiffType diffType) {
    String rtn = '';
    try {
      if (diffType == timeDiffType.getDateDiff) {
        rtn = _selectedDate != null &&
                _selectedDate![0].compareTo(DateTime.now()) > 0 &&
                _selectedDate![1].compareTo(_selectedDate![0]) > 0
            ? '${DateFormat('MM/dd').format(_selectedDate![0])}      ${DateFormat('MM/dd').format(_selectedDate![1])}'
            : '';
      } else if (diffType == timeDiffType.getTimeDiff) {
        rtn = _selectedDate != null &&
                _selectedDate![0].compareTo(DateTime.now()) > 0 &&
                _selectedDate![1].compareTo(_selectedDate![0]) > 0
            ? '${DateFormat('HH:mm').format(_selectedDate![0])} ~ ${DateFormat('HH:mm').format(_selectedDate![1])}'
            : '請選擇現在以後的時間';
      } else if (diffType == timeDiffType.getHoursDiff) {
        rtn = _selectedDate != null &&
                _selectedDate![0].compareTo(DateTime.now()) > 0 &&
                _selectedDate![1].compareTo(_selectedDate![0]) > 0
            ? '${calculateHourDifference(
                '${_selectedDate![0]}',
                '${_selectedDate![1]}',
              )}小時'
            : '0小時';
      }

      return rtn;
    } catch (e) {
      return '處理錯誤';
    }
  }
}
