import 'dart:convert';
import 'fakeData.dart';
import 'http_service_base.dart';
import '../toRentView/models/responseModels/res_rent_space_info.dart';

// 取得可租借車位
Future<List<resRentSpaceInfo>> getParkingSpaces(DateTime? date) async {
  print((date?.day == null ? 0 : date?.day)! % 2);
    // HttpService httpService = HttpService(baseUrl: "nothing"); // TODO 改實際API Server Host
    // final response = await httpService.get('cars', "selectrdDate"); // TODO 改實際API Controller
    final jsonStr = ((date?.day == null ? 0 : date?.day)! % 2 == 0) ? fakeRentSpacesJson1 : fakeRentSpacesJson2; // json.encode(response.data);
    final result = RentSpaceInfoFromJson(jsonStr);
    return result;
  }