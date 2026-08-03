import '../models/food.dart';

final List<Food> fakeFoods = [
  Food(
    id: '1',
    name: 'Cà chua',
    quantity: 3,
    category: 'Rau củ',
    expiryDate: DateTime(2026, 8, 10),
    image: 'assets/imgs/foods/tomato.png',
  ),

  Food(
    id: '2',
    name: 'Trứng gà',
    quantity: 10,
    category: 'Thịt & Cá',
    expiryDate: DateTime(2026, 8, 15),
    image: 'assets/imgs/foods/egg.png',
  ),

  Food(
    id: '3',
    name: 'Sữa tươi',
    quantity: 2,
    category: 'Sữa',
    expiryDate: DateTime(2026, 8, 5),
    image: 'assets/imgs/foods/milk.png',
  ),

  Food(
    id: '4',
    name: 'Coca Cola',
    quantity: 2,
    category: 'Đồ uống',
    expiryDate: DateTime(2026, 8, 5),
    image: 'assets/imgs/foods/coca.png',
  ),

  Food(
    id: '5',
    name: 'Táo',
    quantity: 5,
    category: 'Trái cây',
    expiryDate: DateTime(2026, 8, 12),
    image: 'assets/imgs/foods/apple.png',
  ),
];
