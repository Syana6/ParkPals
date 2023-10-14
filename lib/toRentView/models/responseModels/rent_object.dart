// To parse this JSON data, do
//
//     final ParkingSpace = ParkingSpaceFromJson(jsonString);

import 'dart:convert';

import '../../../enums/ParkingSpaceStatus.dart';

List<ParkingSpace> ParkingSpaceFromJson(String str) => List<ParkingSpace>.from(json.decode(str).map((x) => ParkingSpace.fromJson(x)));

String ParkingSpaceToJson(List<ParkingSpace> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// 車位詳細資訊
class ParkingSpace {
   String owner;   // 車位擁有者
   String floor;   // 車位樓層
   String space;   // 車位號碼
   String price;      // 租借價格 pre hour
   String image;   // 車位照片
   ParkingSpaceStatus status;   // 車位狀態

  ParkingSpace({
    required this.owner,
    required this.floor,
    required this.space,
    required this.price,
    required this.image,
    this.status = ParkingSpaceStatus.available,
  });

    ParkingSpace copyWith({
        String? owner,
        String? floor,
        String? space,
        String? price,
        String? image,
    }) => 
        ParkingSpace(
            owner: owner ?? this.owner,
            floor: floor ?? this.floor,
            space: space ?? this.space,
            price: price ?? this.price,
            image: image ?? this.image,
        );

    factory ParkingSpace.fromJson(Map<String, dynamic> json) => ParkingSpace(
        owner: json["owner"],
        floor: json["floor"],
        space: json["space"],
        price: json["price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "owner": owner,
        "floor": floor,
        "space": space,
        "price": price,
        "image": image,
    };
}