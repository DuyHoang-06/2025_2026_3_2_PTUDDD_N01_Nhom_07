import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/fake_food.dart';
import '../models/food.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController _searchController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  // Danh mục hiện tại
  String _selectedCategory = 'Tất cả';

  // ============================================================
  // CATEGORY
  // ============================================================

  List<String> get categories {
    final List<String> result = ['Tất cả'];

    for (final food in fakeFoods) {
      if (!result.contains(food.category)) {
        result.add(food.category);
      }
    }

    return result;
  }

  // ============================================================
  // FILTER FOOD
  // ============================================================

  List<Food> get filteredFoods {
    List<Food> result = List.from(fakeFoods);

    // Lọc danh mục
    if (_selectedCategory != 'Tất cả') {
      result = result.where((food) {
        return food.category == _selectedCategory;
      }).toList();
    }

    // Tìm kiếm
    final keyword = _searchController.text.trim().toLowerCase();

    if (keyword.isNotEmpty) {
      result = result.where((food) {
        return food.name.toLowerCase().contains(keyword);
      }).toList();
    }

    return result;
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7FAF6),

      appBar: _buildAppBar(),

      body: Column(
        children: [
          const SizedBox(height: 10),

          _buildSearch(),

          const SizedBox(height: 12),

          _buildCategoryFilter(),

          const SizedBox(height: 10),

          Expanded(child: _buildFoodList()),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFoodForm();
        },

        backgroundColor: const Color(0xff4CAF50),

        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // ============================================================
  // APP BAR
  // ============================================================

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffF7FAF6),

      elevation: 0,

      centerTitle: false,

      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Tủ lạnh của tôi',

            style: TextStyle(
              color: Color(0xff19351F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 2),

          Text(
            'Quản lý thực phẩm của bạn',

            style: TextStyle(color: Color(0xff7C897F), fontSize: 11),
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {
            _showFoodForm();
          },

          icon: const Icon(Icons.add_circle_outline, color: Color(0xff4CAF50)),
        ),

        const SizedBox(width: 5),
      ],
    );
  }

  // ============================================================
  // SEARCH
  // ============================================================

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),

      child: Container(
        height: 45,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(14),

          border: Border.all(color: const Color(0xffE2EAE3)),
        ),

        child: TextField(
          controller: _searchController,

          onChanged: (_) {
            setState(() {});
          },

          decoration: InputDecoration(
            hintText: 'Tìm kiếm thực phẩm...',

            hintStyle: const TextStyle(color: Color(0xff9AA49C), fontSize: 12),

            prefixIcon: const Icon(
              Icons.search,
              size: 20,
              color: Color(0xff7C8C80),
            ),

            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();

                      setState(() {});
                    },

                    icon: const Icon(Icons.close, size: 18),
                  )
                : null,

            border: InputBorder.none,

            contentPadding: const EdgeInsets.symmetric(vertical: 13),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // CATEGORY FILTER
  // ============================================================

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 38,

      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        scrollDirection: Axis.horizontal,

        itemCount: categories.length,

        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },

        itemBuilder: (context, index) {
          final category = categories[index];

          final selected = category == _selectedCategory;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },

            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),

              decoration: BoxDecoration(
                color: selected ? const Color(0xff4CAF50) : Colors.white,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: selected
                      ? const Color(0xff4CAF50)
                      : const Color(0xffE2EAE3),
                ),
              ),

              child: Text(
                category,

                style: TextStyle(
                  fontSize: 10,

                  fontWeight: FontWeight.w600,

                  color: selected ? Colors.white : const Color(0xff657067),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // FOOD LIST
  // ============================================================

  Widget _buildFoodList() {
    final foods = filteredFoods;

    if (foods.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 100),

      itemCount: foods.length,

      separatorBuilder: (_, __) {
        return const SizedBox(height: 10);
      },

      itemBuilder: (context, index) {
        return _buildFoodCard(foods[index]);
      },
    );
  }

  // ============================================================
  // FOOD CARD
  // ============================================================

  Widget _buildFoodCard(Food food) {
    final status = _getExpiryStatus(food.expiryDate);

    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(17),

        border: Border.all(color: const Color(0xffE6ECE7)),
      ),

      child: Row(
        children: [
          // IMAGE
          Container(
            width: 70,
            height: 70,

            decoration: BoxDecoration(
              color: const Color(0xffF1F6F1),

              borderRadius: BorderRadius.circular(14),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),

              child: _buildFoodImage(food),
            ),
          ),

          const SizedBox(width: 12),

          // INFORMATION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  food.name,

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Color(0xff1D3022),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  food.category,

                  style: const TextStyle(
                    color: Color(0xff8A968D),
                    fontSize: 10,
                  ),
                ),

                const SizedBox(height: 7),

                Row(
                  children: [
                    const Icon(
                      Icons.inventory_2_outlined,

                      size: 13,

                      color: Color(0xff7D8D81),
                    ),

                    const SizedBox(width: 4),

                    Text(
                      'Số lượng: ${food.quantity}',

                      style: const TextStyle(
                        color: Color(0xff68756C),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                _buildExpiryBadge(status),
              ],
            ),
          ),

          // MENU
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Color(0xff7C887F)),

            onSelected: (value) {
              if (value == 'edit') {
                _showFoodForm(food: food);
              }

              if (value == 'delete') {
                _confirmDelete(food);
              }
            },

            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 'edit',

                  child: Row(
                    children: [
                      Icon(Icons.edit_outlined, size: 18),

                      SizedBox(width: 10),

                      Text('Sửa'),
                    ],
                  ),
                ),

                PopupMenuItem(
                  value: 'delete',

                  child: Row(
                    children: [
                      Icon(Icons.delete_outline, size: 18, color: Colors.red),

                      SizedBox(width: 10),

                      Text('Xóa', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // IMAGE
  // ============================================================

  Widget _buildFoodImage(Food food, {double width = 70, double height = 70}) {
    // ----------------------------------------------------------
    // ẢNH TỪ CAMERA / THƯ VIỆN
    // ----------------------------------------------------------

    if (food.imageBytes != null) {
      return Image.memory(
        food.imageBytes!,

        width: width,
        height: height,

        fit: BoxFit.cover,

        errorBuilder: (context, error, stackTrace) {
          return _defaultFoodIcon(width);
        },
      );
    }

    // ----------------------------------------------------------
    // ẢNH ASSETS
    // ----------------------------------------------------------

    if (food.image != null && food.image!.startsWith('assets/')) {
      return Image.asset(
        food.image!,

        width: width,
        height: height,

        fit: BoxFit.contain,

        errorBuilder: (context, error, stackTrace) {
          return _defaultFoodIcon(width);
        },
      );
    }

    return _defaultFoodIcon(width);
  }

  Widget _defaultFoodIcon(double width) {
    return Icon(
      Icons.fastfood_outlined,

      color: const Color(0xff7D9080),

      size: width * 0.45,
    );
  }

  // ============================================================
  // EXPIRY STATUS
  // ============================================================

  String _getExpiryStatus(DateTime expiryDate) {
    final today = DateTime.now();

    final todayOnly = DateTime(today.year, today.month, today.day);

    final expiryOnly = DateTime(
      expiryDate.year,
      expiryDate.month,
      expiryDate.day,
    );

    final difference = expiryOnly.difference(todayOnly).inDays;

    if (difference < 0) {
      return 'Đã hết hạn';
    }

    if (difference <= 3) {
      return 'Sắp hết hạn';
    }

    return 'Còn hạn';
  }

  Widget _buildExpiryBadge(String status) {
    Color background;
    Color textColor;
    IconData icon;

    if (status == 'Đã hết hạn') {
      background = const Color(0xffffeeee);

      textColor = const Color(0xffE53935);

      icon = Icons.error_outline;
    } else if (status == 'Sắp hết hạn') {
      background = const Color(0xfffff5df);

      textColor = const Color(0xffF39C12);

      icon = Icons.warning_amber_rounded;
    } else {
      background = const Color(0xffE9F7EC);

      textColor = const Color(0xff43A047);

      icon = Icons.check_circle_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),

      decoration: BoxDecoration(
        color: background,

        borderRadius: BorderRadius.circular(7),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(icon, size: 11, color: textColor),

          const SizedBox(width: 4),

          Text(
            status,

            style: TextStyle(
              color: textColor,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EMPTY
  // ============================================================

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            width: 70,
            height: 70,

            decoration: const BoxDecoration(
              color: Color(0xffE9F7EC),

              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.kitchen_outlined,

              size: 35,

              color: Color(0xff4CAF50),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Không tìm thấy thực phẩm',

            style: TextStyle(
              fontSize: 14,

              fontWeight: FontWeight.bold,

              color: Color(0xff35443A),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Hãy thử tìm kiếm với từ khóa khác',

            style: TextStyle(fontSize: 10, color: Color(0xff89958C)),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PICK IMAGE
  // ============================================================

  Future<Uint8List?> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: source,

        imageQuality: 80,

        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (pickedFile == null) {
        return null;
      }

      return await pickedFile.readAsBytes();
    } catch (e) {
      _showMessage('Không thể chọn ảnh');

      return null;
    }
  }

  // ============================================================
  // CHOOSE IMAGE
  // ============================================================

  void _showImagePicker({required Function(Uint8List) onImageSelected}) {
    showModalBottomSheet(
      context: context,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                const Text(
                  'Chọn ảnh thực phẩm',

                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                // GALLERY
                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: const Color(0xffE9F7EC),

                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: const Icon(
                      Icons.photo_library_outlined,

                      color: Color(0xff4CAF50),
                    ),
                  ),

                  title: const Text('Chọn từ thư viện'),

                  onTap: () async {
                    Navigator.pop(context);

                    final bytes = await _pickImage(ImageSource.gallery);

                    if (bytes != null) {
                      onImageSelected(bytes);
                    }
                  },
                ),

                // CAMERA
                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: const Color(0xffE9F7EC),

                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: const Icon(
                      Icons.camera_alt_outlined,

                      color: Color(0xff4CAF50),
                    ),
                  ),

                  title: const Text('Chụp ảnh bằng camera'),

                  onTap: () async {
                    Navigator.pop(context);

                    final bytes = await _pickImage(ImageSource.camera);

                    if (bytes != null) {
                      onImageSelected(bytes);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // ADD / EDIT FORM
  // ============================================================

  void _showFoodForm({Food? food}) {
    final bool isEditing = food != null;

    final nameController = TextEditingController(text: food?.name ?? '');

    final quantityController = TextEditingController(
      text: food?.quantity.toString() ?? '',
    );

    String selectedCategory = food?.category ?? 'Rau củ';

    DateTime selectedExpiryDate =
        food?.expiryDate ?? DateTime.now().add(const Duration(days: 7));

    Uint8List? selectedImageBytes = food?.imageBytes;

    String? selectedAssetImage = food?.image;

    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,

                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // TITLE
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            isEditing ? 'Sửa thực phẩm' : 'Thêm thực phẩm',

                            style: const TextStyle(
                              fontSize: 18,

                              fontWeight: FontWeight.bold,

                              color: Color(0xff19351F),
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // NAME
                    _buildInputLabel('Tên thực phẩm'),

                    const SizedBox(height: 6),

                    TextField(
                      controller: nameController,

                      decoration: _inputDecoration(
                        'Ví dụ: Cà chua',
                        Icons.fastfood_outlined,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // QUANTITY
                    _buildInputLabel('Số lượng'),

                    const SizedBox(height: 6),

                    TextField(
                      controller: quantityController,

                      keyboardType: TextInputType.number,

                      decoration: _inputDecoration(
                        'Ví dụ: 5',
                        Icons.inventory_2_outlined,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // CATEGORY
                    _buildInputLabel('Danh mục'),

                    const SizedBox(height: 6),

                    DropdownButtonFormField<String>(
                      value: selectedCategory,

                      decoration: _inputDecoration('', Icons.category_outlined),

                      items:
                          const [
                            'Rau củ',
                            'Thịt & Cá',
                            'Đồ uống',
                            'Trái cây',
                            'Sữa',
                            'Khác',
                          ].map((category) {
                            return DropdownMenuItem<String>(
                              value: category,

                              child: Text(category),
                            );
                          }).toList(),

                      onChanged: (value) {
                        if (value != null) {
                          setModalState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 14),

                    // EXPIRY
                    _buildInputLabel('Ngày hết hạn'),

                    const SizedBox(height: 6),

                    GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,

                          initialDate: selectedExpiryDate,

                          firstDate: DateTime.now().subtract(
                            const Duration(days: 365),
                          ),

                          lastDate: DateTime.now().add(
                            const Duration(days: 3650),
                          ),
                        );

                        if (date != null) {
                          setModalState(() {
                            selectedExpiryDate = date;
                          });
                        }
                      },

                      child: Container(
                        height: 52,

                        padding: const EdgeInsets.symmetric(horizontal: 14),

                        decoration: BoxDecoration(
                          color: const Color(0xffF7FAF7),

                          borderRadius: BorderRadius.circular(12),

                          border: Border.all(color: const Color(0xffE1E8E2)),
                        ),

                        child: Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,

                              size: 19,

                              color: Color(0xff6D7E72),
                            ),

                            const SizedBox(width: 10),

                            Text(
                              _formatDate(selectedExpiryDate),

                              style: const TextStyle(
                                fontSize: 12,

                                color: Color(0xff344239),
                              ),
                            ),

                            const Spacer(),

                            const Icon(
                              Icons.keyboard_arrow_down,

                              color: Color(0xff87938B),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // IMAGE
                    _buildInputLabel('Ảnh thực phẩm'),

                    const SizedBox(height: 8),

                    GestureDetector(
                      onTap: () {
                        _showImagePicker(
                          onImageSelected: (bytes) {
                            setModalState(() {
                              selectedImageBytes = bytes;

                              selectedAssetImage = null;
                            });
                          },
                        );
                      },

                      child: Container(
                        width: double.infinity,

                        height: 150,

                        decoration: BoxDecoration(
                          color: const Color(0xffF5F8F5),

                          borderRadius: BorderRadius.circular(14),

                          border: Border.all(color: const Color(0xffE1E8E2)),
                        ),

                        child: _buildPreviewImage(
                          selectedImageBytes,
                          selectedAssetImage,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Nhấn vào ảnh để chọn từ thư viện hoặc chụp ảnh bằng camera',

                      style: TextStyle(fontSize: 9, color: Color(0xff8A968D)),
                    ),

                    const SizedBox(height: 22),

                    // SAVE
                    SizedBox(
                      width: double.infinity,

                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                          _saveFood(
                            food: food,

                            isEditing: isEditing,

                            name: nameController.text.trim(),

                            quantity:
                                int.tryParse(quantityController.text.trim()) ??
                                0,

                            category: selectedCategory,

                            expiryDate: selectedExpiryDate,

                            imageBytes: selectedImageBytes,

                            assetImage: selectedAssetImage,
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4CAF50),

                          foregroundColor: Colors.white,

                          elevation: 0,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),

                        child: Text(
                          isEditing ? 'Lưu thay đổi' : 'Thêm thực phẩm',

                          style: const TextStyle(
                            fontSize: 13,

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ============================================================
  // IMAGE PREVIEW
  // ============================================================

  Widget _buildPreviewImage(Uint8List? imageBytes, String? assetImage) {
    if (imageBytes != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),

        child: Image.memory(
          imageBytes,

          width: double.infinity,

          height: 150,

          fit: BoxFit.cover,
        ),
      );
    }

    if (assetImage != null && assetImage.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(14),

        child: Image.asset(
          assetImage,

          width: double.infinity,

          height: 150,

          fit: BoxFit.contain,
        ),
      );
    }

    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(Icons.add_a_photo_outlined, size: 35, color: Color(0xff7D9080)),

        SizedBox(height: 8),

        Text(
          'Thêm ảnh',

          style: TextStyle(fontSize: 11, color: Color(0xff7D9080)),
        ),
      ],
    );
  }

  // ============================================================
  // SAVE FOOD
  // ============================================================

  void _saveFood({
    required Food? food,

    required bool isEditing,

    required String name,

    required int quantity,

    required String category,

    required DateTime expiryDate,

    required Uint8List? imageBytes,

    required String? assetImage,
  }) {
    // Kiểm tra tên
    if (name.isEmpty) {
      _showMessage('Vui lòng nhập tên thực phẩm');

      return;
    }

    // Kiểm tra số lượng
    if (quantity <= 0) {
      _showMessage('Số lượng phải lớn hơn 0');

      return;
    }

    // ==========================================================
    // EDIT
    // ==========================================================

    if (isEditing && food != null) {
      // Tìm thực phẩm khác
      // có cùng tên
      final duplicateIndex = fakeFoods.indexWhere((item) {
        return item.id != food.id &&
            item.name.trim().toLowerCase() == name.trim().toLowerCase();
      });

      // --------------------------------------------------------
      // TRÙNG TÊN
      // --------------------------------------------------------

      if (duplicateIndex != -1) {
        setState(() {
          fakeFoods[duplicateIndex].quantity += quantity;

          fakeFoods[duplicateIndex].category = category;

          fakeFoods[duplicateIndex].expiryDate = expiryDate;

          if (imageBytes != null) {
            fakeFoods[duplicateIndex].imageBytes = imageBytes;

            fakeFoods[duplicateIndex].image = null;
          }

          fakeFoods.removeWhere((item) {
            return item.id == food.id;
          });
        });

        Navigator.pop(context);

        _showMessage('Tên trùng, đã cộng dồn số lượng');

        return;
      }

      // --------------------------------------------------------
      // KHÔNG TRÙNG
      // --------------------------------------------------------

      setState(() {
        food.name = name;

        food.quantity = quantity;

        food.category = category;

        food.expiryDate = expiryDate;

        if (imageBytes != null) {
          food.imageBytes = imageBytes;

          food.image = null;
        } else if (assetImage != null) {
          food.image = assetImage;
        }
      });

      Navigator.pop(context);

      _showMessage('Đã cập nhật thực phẩm');

      return;
    }

    // ==========================================================
    // ADD
    // ==========================================================

    final existingIndex = fakeFoods.indexWhere((item) {
      return item.name.trim().toLowerCase() == name.trim().toLowerCase();
    });

    // ----------------------------------------------------------
    // ĐÃ TỒN TẠI
    // ----------------------------------------------------------

    if (existingIndex != -1) {
      setState(() {
        fakeFoods[existingIndex].quantity += quantity;

        fakeFoods[existingIndex].category = category;

        fakeFoods[existingIndex].expiryDate = expiryDate;

        if (imageBytes != null) {
          fakeFoods[existingIndex].imageBytes = imageBytes;

          fakeFoods[existingIndex].image = null;
        }
      });

      Navigator.pop(context);

      _showMessage('Đã cộng thêm $quantity vào $name');

      return;
    }

    // ----------------------------------------------------------
    // CHƯA TỒN TẠI
    // ----------------------------------------------------------

    final newFood = Food(
      id: DateTime.now().millisecondsSinceEpoch.toString(),

      name: name,

      quantity: quantity,

      category: category,

      expiryDate: expiryDate,

      image: imageBytes == null ? assetImage : null,

      imageBytes: imageBytes,
    );

    setState(() {
      fakeFoods.add(newFood);
    });

    Navigator.pop(context);

    _showMessage('Đã thêm $name vào tủ lạnh');
  }

  // ============================================================
  // DELETE
  // ============================================================

  void _confirmDelete(Food food) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),

          title: const Text(
            'Xóa thực phẩm?',

            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),

          content: Text(
            'Bạn có chắc muốn xóa "${food.name}" khỏi tủ lạnh không?',

            style: const TextStyle(fontSize: 12, color: Color(0xff68756C)),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Hủy',

                style: TextStyle(color: Color(0xff68756C)),
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  fakeFoods.removeWhere((item) {
                    return item.id == food.id;
                  });
                });

                Navigator.pop(context);

                _showMessage('Đã xóa ${food.name}');
              },

              child: const Text(
                'Xóa',

                style: TextStyle(
                  color: Colors.red,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // INPUT LABEL
  // ============================================================

  Widget _buildInputLabel(String title) {
    return Text(
      title,

      style: const TextStyle(
        fontSize: 11,

        fontWeight: FontWeight.bold,

        color: Color(0xff35443A),
      ),
    );
  }

  // ============================================================
  // INPUT DECORATION
  // ============================================================

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(fontSize: 11, color: Color(0xff9AA49C)),

      prefixIcon: Icon(icon, size: 19, color: Color(0xff718076)),

      filled: true,

      fillColor: const Color(0xffF7FAF7),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: const BorderSide(color: Color(0xffE1E8E2)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: const BorderSide(color: Color(0xffE1E8E2)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: const BorderSide(color: Color(0xff4CAF50)),
      ),
    );
  }

  // ============================================================
  // DATE
  // ============================================================

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');

    final month = date.month.toString().padLeft(2, '0');

    final year = date.year.toString();

    return '$day/$month/$year';
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
      );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }
}
