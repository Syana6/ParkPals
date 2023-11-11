// 社區詳細資訊
import 'dart:convert';
import '../../../../enums/ParkingSpaceStatus.dart';

class Communities {
  final String name;    // 社區名稱
  final String address; // 社區地址
  final List<resMyRentSpaceInfo>? parkingSpaces; // 社區車位

  Communities({
    required this.name,
    required this.address,
    this.parkingSpaces,
  });
}


List<resMyRentSpaceInfo> MyRentSpaceInfoFromJson(String str) => List<resMyRentSpaceInfo>.from(json.decode(str).map((x) => resMyRentSpaceInfo.fromJson(x)));

String MyRentSpaceInfoToJson(List<resMyRentSpaceInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// 車位詳細資訊
class resMyRentSpaceInfo {
   String owner;   // 車位擁有者
   String floor;   // 車位樓層
   String space;   // 車位號碼
   String price;   // 租借價格 pre hour
   String image;   // 車位照片
   String? idleDate; // 有空位日期
   String? idleStrTime; // 空位時間起點
   String? idleEndTime;  // 空位時間終點
   ParkingSpaceStatus status;   // 車位狀態

  resMyRentSpaceInfo({
    required this.owner,
    required this.floor,
    required this.space,
    required this.price,
    required this.image,
    this.idleDate,
    this.idleStrTime,
    this.idleEndTime,
    this.status = ParkingSpaceStatus.available,
  });

    resMyRentSpaceInfo copyWith({
        String? owner,
        String? floor,
        String? space,
        String? price,
        String? image,
        String? idleDate,
        String? idleStrTime,
        String? idleEndTime,
    }) => 
        resMyRentSpaceInfo(
            owner: owner ?? this.owner,
            floor: floor ?? this.floor,
            space: space ?? this.space,
            price: price ?? this.price,
            image: image ?? this.image,
            idleDate: idleDate ?? this.idleDate,
            idleStrTime: idleStrTime ?? this.idleStrTime,
            idleEndTime: idleEndTime ?? this.idleEndTime,
        );

    factory resMyRentSpaceInfo.fromJson(Map<String, dynamic> json) => resMyRentSpaceInfo(
        owner: json["owner"],
        floor: json["floor"],
        space: json["space"],
        price: json["price"],
        image: json["image"],
        idleDate: json["idleDate"],
        idleStrTime: json["idleStrTime"],
        idleEndTime: json["idleEndTime"],
    );

    Map<String, dynamic> toJson() => {
        "owner": owner,
        "floor": floor,
        "space": space,
        "price": price,
        "image": image,
        "idleDate": idleDate,
        "idleStrTime": idleStrTime,
        "idleEndTime": idleEndTime,
    };
}