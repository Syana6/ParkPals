import '../myParkingView/models/responseModels/responseModels/res_parking_space_info.dart';
import '../toRentView/models/responseModels/res_rent_space_info.dart';

List<Communities> fakeCommunities = <Communities>[
  Communities(
    name: '金櫻花園',
    address: '台北市大安區金華街 1 號',
    parkingSpaces: <resMyRentSpaceInfo>[
      resMyRentSpaceInfo(
        owner: '我有一台車',
        floor: 'B1',
        space: 'B1-001',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
      resMyRentSpaceInfo(
        owner: '我有兩台車',
        floor: 'B1',
        space: 'B1-002',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
      resMyRentSpaceInfo(
        owner: '我超過三台車',
        floor: 'B1',
        space: 'B1-003',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
    ],
  ),
  Communities(
    name: '金櫻一品',
    address: '台北市大安區金華街 2 號',
    parkingSpaces: <resMyRentSpaceInfo>[
      resMyRentSpaceInfo(
        owner: '我車位很多',
        floor: 'B1',
        space: 'B1-001',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
      resMyRentSpaceInfo(
        owner: '我有你沒有',
        floor: 'B1',
        space: 'B1-002',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
    ],
  ),
  Communities(
    name: '金櫻廣場',
    address: '台北市大安區金華街 3 號',
    parkingSpaces: <resMyRentSpaceInfo>[
      resMyRentSpaceInfo(
        owner: '這裡只有一個車位',
        floor: 'B1',
        space: 'B1-002',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
    ],
  ),
  Communities(
    name: '金櫻鎮',
    address: '台北市大安區金華街 3 號',
    parkingSpaces: <resMyRentSpaceInfo>[
      resMyRentSpaceInfo(
        owner: '有也不租你',
        floor: 'B1',
        space: 'B1-002',
        price: "50",
        image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
        idleDate:'2023-10-31',
        idleStrTime:'08:00',
        idleEndTime:'12:00'
      ),
    ],
  ),
];



// fake api 我上架的車位
List<resMyRentSpaceInfo> fakeParkingSpaces = <resMyRentSpaceInfo>[
  resMyRentSpaceInfo(
    owner: '266-1 11F',
    floor: 'B1',
    space: '52',
    price: "15",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resMyRentSpaceInfo(
    owner: '預計用Line的名稱',
    floor: 'B1',
    space: 'A02',
    price: "20",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resMyRentSpaceInfo(
    owner: '沒有Line的名稱就用樓層+車位號碼',
    floor: 'B1',
    space: 'A03',
    price: "25",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  )
];

// fake api 可租借車位
List<resRentSpaceInfo> fakeRentSpaces = <resRentSpaceInfo>[
  resRentSpaceInfo(
    owner: '266-1 11F',
    floor: 'B1',
    space: '52',
    price: "15",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '預計用Line的名稱',
    floor: 'B1',
    space: 'A02',
    price: "20",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '沒有Line的名稱就用樓層+車位號碼',
    floor: 'B1',
    space: 'A03',
    price: "25",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '高小姊接',
    floor: 'B1',
    space: 'A04',
    price: "10",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬瑟夫·喬斯達',
    floor: 'B1',
    space: 'A05',
    price: "0",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬納森·喬斯達',
    floor: 'B1',
    space: 'A06',
    price: "100",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '空條坑錢承太郎',
    floor: 'B1',
    space: 'A07',
    price: "120",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '魯',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '諾',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬魯巴納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬巴納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬魯',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '魯巴納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬魯諾喬巴納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '巴納',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  ),
  resRentSpaceInfo(
    owner: '喬·喬',
    floor: 'B1',
    space: 'A08',
    price: "35",
    image: '/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg',
    idleDate:'2023-10-31',
    idleStrTime:'08:00',
    idleEndTime:'12:00'
  )
];

var fakeRentSpacesJson1 = '''[
    {
      "owner": "266-1 1F",
      "floor": "B1",
      "space": "52",
      "price": "15",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"05:00",
      "idleEndTime":"21:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B1",
      "space": "52",
      "price": "15",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"01:00",
      "idleEndTime":"12:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 100F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 200F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    },
    {
      "owner": "266-8 0F",
      "floor": "B3",
      "space": "22",
      "price": "150",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2024-12-31",
      "idleStrTime":"15:00",
      "idleEndTime":"22:00"
    }
  ]
''';


var fakeRentSpacesJson2 = '''[
    {
      "owner": "266-1 11F",
      "floor": "B1",
      "space": "52",
      "price": "15",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2023-12-31",
      "idleStrTime":"08:00",
      "idleEndTime":"12:00"
    },
    {
      "owner": "266-1 13F",
      "floor": "B1",
      "space": "52",
      "price": "15",
      "image": "/Users/Syana/Side Project/ParkPals/parkpals/lib/assets/images/parking_space_1.jpg",
      "idleDate":"2023-10-31",
      "idleStrTime":"08:00",
      "idleEndTime":"12:00"
    }
  ]
''';