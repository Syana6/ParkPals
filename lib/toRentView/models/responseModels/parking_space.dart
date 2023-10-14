// 社區詳細資訊
import 'rent_object.dart';

class Communities {
  final String name;    // 社區名稱
  final String address; // 社區地址
  final List<ParkingSpace>? parkingSpaces; // 社區車位

  Communities({
    required this.name,
    required this.address,
    this.parkingSpaces,
  });
}