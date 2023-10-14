import 'dart:convert';
import '../toRentView/models/fakeData.dart';
import 'http_service_base.dart';
import '../toRentView/models/responseModels/rent_object.dart';

// 取得可租借車位
Future<List<ParkingSpace>> getParkingSpaces() async {
    // HttpService httpService = HttpService(baseUrl: "nothing"); // TODO 改實際API Server Host
    // final response = await httpService.get('cars', "selectrdDate"); // TODO 改實際API Controller
    final jsonStr = fakeParkingSpacesJson; // json.encode(response.data);
    final result = ParkingSpaceFromJson(jsonStr);
    return result;
  }