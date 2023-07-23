// 社區詳細資訊
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

// 車位詳細資訊
class ParkingSpace {
  final String owner;   // 車位擁有者
  final String floor;   // 車位樓層
  final String space;   // 車位號碼
  final int price;      // 租借價格 pre hour
  final String image;   // 車位照片
  final ParkingSpaceStatus status;   // 車位狀態

  ParkingSpace({
    required this.owner,
    required this.floor,
    required this.space,
    required this.price,
    required this.image,
    this.status = ParkingSpaceStatus.available,
  });
}

// 車位租借狀態
enum ParkingSpaceStatus {
  available,    // 可租借
  rented,       // 已被租借
  unavailable,  // 不可租借（隱藏中）
}