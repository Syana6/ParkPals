// SelectDateListView 使用的日期時間model

class SelectDateData {
  SelectDateData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String? imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  // TODO:fake to getDate
  static List<SelectDateData> tabIconsList = <SelectDateData>[
    SelectDateData(
      imagePath: null,
      titleTxt: 'Tue',
      kacl: 31,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Wen',
      kacl: 02,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Thu',
      kacl: 03,
      meals: <String>['Recommend:', '800 kcal'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Fir',
      kacl: 05,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Sat',
      kacl: 06,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Sat',
      kacl: 06,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
    SelectDateData(
      imagePath: null,
      titleTxt: 'Sun',
      kacl: 07,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
