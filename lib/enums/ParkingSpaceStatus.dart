// 車位租借狀態
enum ParkingSpaceStatus {
  available(1),    // 可租借
  rented(2),       // 已被租借
  unavailable(3);  // 不可租借（隱藏中）

  const ParkingSpaceStatus(this.enumValue);
  
  /// Convert value to enum type
  /// When value not found, and [defaultValue] is null will Return first enum value.
  factory ParkingSpaceStatus.toEnum(int x, {dynamic defaultValue}) {
    var filter = values.where((element) => element.enumValue == x);
    return filter.isNotEmpty ? filter.first : defaultValue ?? values.first;
  }

  final int enumValue;
}