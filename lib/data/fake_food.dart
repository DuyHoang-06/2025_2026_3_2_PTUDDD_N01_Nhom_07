import '../models/food.dart';

final List<Food> fakeFoods = [
  Food(
    id: '1',
    name: 'Cà chua',
    quantity: 3,
    category: 'Rau củ',
    expiryDate: DateTime(2026, 8, 3),
  ),

  Food(
    id: '2',
    name: 'Trứng gà',
    quantity: 10,
    category: 'Thịt & Cá',
    expiryDate: DateTime(2026, 8, 8),
  ),

  Food(
    id: '3',
    name: 'Sữa tươi',
    quantity: 2,
    category: 'Đồ uống',
    expiryDate: DateTime(2026, 8, 1),
  ),

  Food(
    id: '4',
    name: 'Táo',
    quantity: 5,
    category: 'Trái cây',
    expiryDate: DateTime(2026, 7, 6),
  ),
];
