// To parse this JSON data, do
//
//     final ParkingSpace = ParkingSpaceFromJson(jsonString);

import 'dart:convert';
import '../../../enums/ParkingSpaceStatus.dart';

List<resRentSpaceInfo> RentSpaceInfoFromJson(String str) => List<resRentSpaceInfo>.from(json.decode(str).map((x) => resRentSpaceInfo.fromJson(x)));

String RentSpaceInfoToJson(List<resRentSpaceInfo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// 車位詳細資訊
class resRentSpaceInfo {
   String communityID;   // 社區編號
   String communityName;   // 社區名稱
   String owner;   // 車位擁有者
   String floor;   // 車位樓層
   String space;   // 車位號碼
   String price;   // 租借價格 pre hour
   String image;   // 車位照片
   String? idleDate; // 有空位日期
   String? idleStrTime; // 空位時間起點
   String? idleEndTime;  // 空位時間終點
   ParkingSpaceStatus status;   // 車位狀態

  resRentSpaceInfo({
    required this.communityID,
    required this.communityName,
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

    resRentSpaceInfo copyWith({
        String? communityID,
        String? communityName,
        String? owner,
        String? floor,
        String? space,
        String? price,
        String? image,
        String? idleDate,
        String? idleStrTime,
        String? idleEndTime,
    }) => 
        resRentSpaceInfo(
            communityID: communityID ?? this.communityID,
            communityName: communityName ?? this.communityName,
            owner: owner ?? this.owner,
            floor: floor ?? this.floor,
            space: space ?? this.space,
            price: price ?? this.price,
            image: image ?? this.image,
            idleDate: idleDate ?? this.idleDate,
            idleStrTime: idleStrTime ?? this.idleStrTime,
            idleEndTime: idleEndTime ?? this.idleEndTime,
        );

    factory resRentSpaceInfo.fromJson(Map<String, dynamic> json) => resRentSpaceInfo(
        communityID: json["communityID"],
        communityName: json["communityName"],
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
        "communityID": communityID,
        "communityName": communityName,
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