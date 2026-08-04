import 'dart:typed_data';

class Food {
  final String id;

  /// Tên hiển thị mặc định (VI).
  String name;

  /// Khoá dịch của tên, dùng để hiển thị theo ngôn ngữ hiện tại.
  String nameKey;

  int quantity;
  String category;

  /// Khoá dịch của category (ví dụ 'category_vegetable').
  /// Dùng để lọc / so sánh danh mục mà không phụ thuộc ngôn ngữ.
  String categoryKey;

  DateTime expiryDate;

  // Ảnh mặc định trong assets
  String? image;

  // Ảnh lấy từ camera / thư viện
  Uint8List? imageBytes;

  Food({
    required this.id,
    required this.name,
    required this.nameKey,
    required this.quantity,
    required this.category,
    required this.categoryKey,
    required this.expiryDate,
    this.image,
    this.imageBytes,
  });
}
