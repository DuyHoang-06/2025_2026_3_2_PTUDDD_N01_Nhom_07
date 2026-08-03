import '../models/recipe.dart';

final List<Recipe> fakeRecipes = [
  Recipe(
    id: '1',
    name: 'Cà Chua Xào Trứng',
    image: 'assets/imgs/recipes/ca_chua_xao_trung.jpg',
    rating: 4.8,
    cookingTime: 15,
    calories: 320,
    category: 'Nấu nhanh',

    ingredients: [
      '300g Cà Chua Bi',
      '3 Quả Trứng Gà',
      '200g Ức Gà',
      '2 Tép Tỏi',
      '1 Muỗng canh Dầu Mè',
      'Muối & Tiêu theo khẩu vị',
    ],

    steps: [
      'Đun nóng dầu mè trong chảo lớn vừa.',
      'Thêm tỏi băm, xào thơm khoảng 30 giây.',
      'Cho ức gà vào xào đến khi vàng đẹp.',
      'Thêm cà chua, đảo đều trong 2 phút.',
      'Tạo hốc nhỏ, đập trứng vào khuấy nhẹ.',
      'Nêm muối tiêu, đun lửa nhỏ cho đến khi nóng.',
    ],
  ),

  Recipe(
    id: '2',
    name: 'Cơm Gà Rau Củ',
    image: 'assets/imgs/recipes/ca_chua_xao_trung.jpg',
    rating: 4.6,
    cookingTime: 30,
    calories: 480,
    category: 'Lành mạnh',

    ingredients: [
      '200g Ức Gà',
      '150g Cơm',
      '100g Cà Rốt',
      '100g Bông Cải',
      '1 Muỗng Dầu Ô Liu',
      'Muối & Tiêu',
    ],

    steps: [
      'Rửa sạch và sơ chế rau củ.',
      'Luộc hoặc hấp rau củ.',
      'Áp chảo ức gà.',
      'Chuẩn bị cơm ra đĩa.',
      'Thêm thịt gà và rau củ.',
      'Nêm gia vị vừa ăn.',
    ],
  ),

  Recipe(
    id: '3',
    name: 'Cơm Trộn Hàn Quốc',
    image: 'assets/imgs/recipes/ca_chua_xao_trung.jpg',
    rating: 4.9,
    cookingTime: 45,
    calories: 560,
    category: 'Món Hàn',

    ingredients: [
      '200g Cơm',
      '100g Thịt Bò',
      '1 Củ Cà Rốt',
      'Rau Cải',
      '1 Quả Trứng',
      'Sốt Gochujang',
    ],

    steps: [
      'Sơ chế rau củ.',
      'Xào thịt bò với gia vị.',
      'Chiên trứng.',
      'Cho cơm vào tô.',
      'Xếp các nguyên liệu lên trên.',
      'Thêm sốt Gochujang và thưởng thức.',
    ],
  ),

  Recipe(
    id: '4',
    name: 'Canh Kim Chi',
    image: 'assets/imgs/recipes/ca_chua_xao_trung.jpg',
    rating: 4.7,
    cookingTime: 20,
    calories: 180,
    category: 'Món Hàn',

    ingredients: [
      '200g Kim Chi',
      '100g Thịt Heo',
      '100g Đậu Phụ',
      'Hành Lá',
      'Ớt Bột Hàn Quốc',
    ],

    steps: [
      'Xào kim chi và thịt heo.',
      'Thêm nước vào nồi.',
      'Đun sôi.',
      'Cho đậu phụ vào.',
      'Nêm gia vị.',
      'Thêm hành lá rồi tắt bếp.',
    ],
  ),

  Recipe(
    id: '5',
    name: 'Bánh Sinh Tố Xanh',
    image: 'assets/imgs/recipes/ca_chua_xao_trung.jpg',
    rating: 4.5,
    cookingTime: 10,
    calories: 280,
    category: 'Lành mạnh',

    ingredients: [
      '1 Quả Chuối',
      '100g Rau Cải Bó Xôi',
      '150ml Sữa',
      '1 Muỗng Mật Ong',
      'Đá Viên',
    ],

    steps: [
      'Rửa sạch rau cải.',
      'Cắt chuối thành từng miếng.',
      'Cho tất cả nguyên liệu vào máy xay.',
      'Xay đến khi mịn.',
      'Đổ ra ly.',
      'Thưởng thức ngay.',
    ],
  ),
];
