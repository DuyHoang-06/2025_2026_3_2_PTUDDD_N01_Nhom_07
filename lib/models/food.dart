import 'dart:typed_data';

class Food {
  final String id;

  String name;
  int quantity;
  String category;
  DateTime expiryDate;

  /// Khoá dịch của category (ví dụ 'category_vegetable').
  /// Dùng để lọc / so sánh danh mục mà không phụ thuộc ngôn ngữ.
  String categoryKey;

  // Ảnh mặc định trong assets
  String? image;

  // Ảnh lấy từ camera / thư viện
  Uint8List? imageBytes;

  Food({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    required this.categoryKey,
    required this.expiryDate,
    this.image,
    this.imageBytes,
  });
}
