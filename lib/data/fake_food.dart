import '../models/food.dart';

final List<Food> fakeFoods = [
  Food(
    id: '1',
    name: 'Cà chua',
    nameKey: 'food_tomato',
    quantity: 3,
    category: 'Rau củ',
    categoryKey: 'category_vegetable',
    expiryDate: DateTime(2026, 8, 10),
    image: 'assets/imgs/foods/tomato.png',
  ),

  Food(
    id: '2',
    name: 'Trứng gà',
    nameKey: 'food_egg',
    quantity: 10,
    category: 'Thịt & Cá',
    categoryKey: 'category_meat',
    expiryDate: DateTime(2026, 8, 15),
    image: 'assets/imgs/foods/egg.png',
  ),

  Food(
    id: '3',
    name: 'Sữa tươi',
    nameKey: 'food_milk',
    quantity: 2,
    category: 'Sữa',
    categoryKey: 'category_milk',
    expiryDate: DateTime(2026, 8, 5),
    image: 'assets/imgs/foods/milk.png',
  ),

  Food(
    id: '4',
    name: 'Coca Cola',
    nameKey: 'food_coca',
    quantity: 2,
    category: 'Đồ uống',
    categoryKey: 'category_drink',
    expiryDate: DateTime(2026, 8, 5),
    image: 'assets/imgs/foods/coca.png',
  ),

  Food(
    id: '5',
    name: 'Táo',
    nameKey: 'food_apple',
    quantity: 5,
    category: 'Trái cây',
    categoryKey: 'category_fruit',
    expiryDate: DateTime(2026, 8, 12),
    image: 'assets/imgs/foods/apple.png',
  ),
];