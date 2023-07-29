import 'package:parkpals/models/parkingSpace.dart';

List<Communities> fakeCommunities = <Communities>[
  Communities(
    name: '金櫻花園',
    address: '台北市大安區金華街 1 號',
    parkingSpaces: <ParkingSpace>[
      ParkingSpace(
        owner: '我有一台車',
        floor: 'B1',
        space: 'B1-001',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
      ParkingSpace(
        owner: '我有兩台車',
        floor: 'B1',
        space: 'B1-002',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
      ParkingSpace(
        owner: '我超過三台車',
        floor: 'B1',
        space: 'B1-003',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
    ],
  ),
  Communities(
    name: '金櫻一品',
    address: '台北市大安區金華街 2 號',
    parkingSpaces: <ParkingSpace>[
      ParkingSpace(
        owner: '我車位很多',
        floor: 'B1',
        space: 'B1-001',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
      ParkingSpace(
        owner: '我有你沒有',
        floor: 'B1',
        space: 'B1-002',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
    ],
  ),
  Communities(
    name: '金櫻廣場',
    address: '台北市大安區金華街 3 號',
    parkingSpaces: <ParkingSpace>[
      ParkingSpace(
        owner: '這裡只有一個車位',
        floor: 'B1',
        space: 'B1-002',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
    ],
  ),
  Communities(
    name: '金櫻鎮',
    address: '台北市大安區金華街 3 號',
    parkingSpaces: <ParkingSpace>[
      ParkingSpace(
        owner: '有也不租你',
        floor: 'B1',
        space: 'B1-002',
        price: 50,
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
      ),
    ],
  ),
];



List<ParkingSpace> fakeParkingSpaces = <ParkingSpace>[
  ParkingSpace(
    owner: '266-1 11F',
    floor: 'B1',
    space: '52',
    price: 15,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '預計用Line的名稱',
    floor: 'B1',
    space: 'A02',
    price: 30,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '沒有Line的名稱就用樓層+車位號碼',
    floor: 'B1',
    space: 'A03',
    price: 25,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '高小姊接',
    floor: 'B1',
    space: 'A04',
    price: 10,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '喬瑟夫·喬斯達',
    floor: 'B1',
    space: 'A05',
    price: 0,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '喬納森·喬斯達',
    floor: 'B1',
    space: 'A06',
    price: 100,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '空條坑錢承太郎',
    floor: 'B1',
    space: 'A07',
    price: 120,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  ),
  ParkingSpace(
    owner: '喬魯諾·喬巴納',
    floor: 'B1',
    space: 'A08',
    price: 35,
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
  )
];
