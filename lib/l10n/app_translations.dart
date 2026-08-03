/// Bảng dịch song ngữ VI ↔ EN cho toàn bộ app.
/// Thêm key mới ở đây để dùng `t(context, 'key')` ở bất kỳ đâu.
class AppTranslations {
  final String locale;

  AppTranslations(this.locale);

  static const Map<String, Map<String, String>> _values = {
                'app_name': {'vi': 'Smart Fridge', 'en': 'Smart Fridge'},
    'cancel': {'vi': 'Hủy', 'en': 'Cancel'},
    'delete': {'vi': 'Xóa', 'en': 'Delete'},
    'edit': {'vi': 'Sửa', 'en': 'Edit'},
    'save': {'vi': 'Lưu', 'en': 'Save'},
    'all': {'vi': 'Tất cả', 'en': 'All'},
    'other': {'vi': 'Khác', 'en': 'Other'},
    'items_count': {'vi': 'món', 'en': 'items'},

                'splash_tagline': {
      'vi': 'Quản Lý Thực Phẩm Thông Minh Bằng AI',
      'en': 'Smart Food Management Powered by AI',
    },
    'splash_continue': {'vi': 'Nhấn để tiếp tục', 'en': 'Tap to continue'},

                'login_welcome': {'vi': 'Chào mừng trở lại', 'en': 'Welcome back'},
    'login_subtitle': {
      'vi': 'Đăng nhập vào tài khoản Smart Fridge của bạn',
      'en': 'Sign in to your Smart Fridge account',
    },
    'login_email_hint': {
      'vi': 'hoang@gmail.com',
      'en': 'name@example.com',
    },
    'login_password_hint': {'vi': '••••••••', 'en': '••••••••'},
    'login_label_email': {'vi': 'EMAIL', 'en': 'EMAIL'},
    'login_label_password': {'vi': 'MẬT KHẨU', 'en': 'PASSWORD'},
    'login_forgot': {'vi': 'Quên mật khẩu?', 'en': 'Forgot password?'},
    'login_button': {'vi': 'Đăng Nhập', 'en': 'Sign In'},
    'login_no_account': {'vi': 'Chưa có tài khoản?', 'en': "Don't have an account?"},
    'login_register': {'vi': 'Đăng ký', 'en': 'Sign up'},
    'login_error_invalid': {
      'vi': 'Email hoặc mật khẩu không đúng!',
      'en': 'Invalid email or password!',
    },

                'register_title': {'vi': 'Tạo tài khoản', 'en': 'Create account'},
    'register_subtitle': {
      'vi': 'Đăng ký để sử dụng Smart Fridge',
      'en': 'Sign up to start using Smart Fridge',
    },
    'register_name': {'vi': 'HỌ VÀ TÊN', 'en': 'FULL NAME'},
    'register_name_hint': {'vi': 'Nhập họ và tên', 'en': 'Enter your full name'},
    'register_email_hint': {'vi': 'Nhập email', 'en': 'Enter your email'},
    'register_password_hint': {'vi': 'Nhập mật khẩu', 'en': 'Enter your password'},
    'register_confirm_password': {'vi': 'XÁC NHẬN MẬT KHẨU', 'en': 'CONFIRM PASSWORD'},
    'register_confirm_hint': {
      'vi': 'Nhập lại mật khẩu',
      'en': 'Re-enter your password',
    },
    'register_button': {'vi': 'Đăng Ký', 'en': 'Sign Up'},
    'register_have_account': {
      'vi': 'Đã có tài khoản?',
      'en': 'Already have an account?',
    },
    'register_login': {'vi': 'Đăng nhập', 'en': 'Sign in'},

                'home_greeting': {'vi': 'TỦ LẠNH CỦA TÔI', 'en': 'MY FRIDGE'},
    'home_user_name': {'vi': 'Duy Hoàng', 'en': 'Duy Hoang'},
    'home_total': {'vi': 'Tổng món', 'en': 'Total'},
    'home_expiring': {'vi': 'Sắp hết hạn', 'en': 'Expiring'},
    'home_expired': {'vi': 'Hết hạn', 'en': 'Expired'},
    'home_search_hint': {'vi': 'Tìm kiếm thực phẩm...', 'en': 'Search food...'},
    'home_total_foods': {'vi': 'Tổng Thực Phẩm', 'en': 'Total Foods'},
    'home_soon_expired': {'vi': 'Sắp Hết Hạn', 'en': 'Expiring Soon'},
    'home_already_expired': {'vi': 'Đã Hết Hạn', 'en': 'Already Expired'},
    'home_categories': {'vi': 'Danh Mục', 'en': 'Categories'},
    'home_see_all': {'vi': 'Xem tất cả', 'en': 'See all'},
    'home_ai_today': {'vi': 'Gợi Ý AI Hôm Nay', 'en': "Today's AI Suggestion"},
    'home_ai_badge': {'vi': 'AI Gợi Ý', 'en': 'AI Pick'},
    'home_ai_more': {'vi': 'Thêm', 'en': 'More'},
    'home_suggestion_with': {
      'vi': 'Món ăn với',
      'en': 'Recipe with',
    },
    'home_suggestion_empty': {
      'vi': 'Chưa có gợi ý món ăn',
      'en': 'No recipe suggestion yet',
    },

        'category_vegetable': {'vi': 'Rau củ', 'en': 'Vegetables'},
    'category_meat': {'vi': 'Thịt & Cá', 'en': 'Meat & Fish'},
    'category_drink': {'vi': 'Đồ uống', 'en': 'Drinks'},
    'category_fruit': {'vi': 'Trái cây', 'en': 'Fruits'},
    'category_milk': {'vi': 'Sữa', 'en': 'Dairy'},
    'category_other': {'vi': 'Khác', 'en': 'Other'},

                'tab_home': {'vi': 'Trang chủ', 'en': 'Home'},
    'tab_fridge': {'vi': 'Tủ lạnh', 'en': 'Fridge'},
    'tab_ai': {'vi': 'AI', 'en': 'AI'},
    'tab_profile': {'vi': 'Cá nhân', 'en': 'Profile'},

                'fridge_title': {'vi': 'Tủ lạnh của tôi', 'en': 'My Fridge'},
    'fridge_subtitle': {
      'vi': 'Quản lý thực phẩm của bạn',
      'en': 'Manage your food items',
    },
    'fridge_search_hint': {'vi': 'Tìm kiếm thực phẩm...', 'en': 'Search food...'},
    'fridge_quantity': {'vi': 'Số lượng', 'en': 'Quantity'},
    'fridge_empty_title': {
      'vi': 'Không tìm thấy thực phẩm',
      'en': 'No food found',
    },
    'fridge_empty_subtitle': {
      'vi': 'Hãy thử tìm kiếm với từ khóa khác',
      'en': 'Try a different keyword',
    },

        'status_expired': {'vi': 'Đã hết hạn', 'en': 'Expired'},
    'status_expiring': {'vi': 'Sắp hết hạn', 'en': 'Expiring soon'},
    'status_fresh': {'vi': 'Còn hạn', 'en': 'Fresh'},

        'picker_title': {'vi': 'Chọn ảnh thực phẩm', 'en': 'Pick food image'},
    'picker_gallery': {'vi': 'Chọn từ thư viện', 'en': 'Choose from gallery'},
    'picker_camera': {'vi': 'Chụp ảnh bằng camera', 'en': 'Take a photo'},
    'picker_error': {'vi': 'Không thể chọn ảnh', 'en': 'Could not pick image'},

        'form_edit_food': {'vi': 'Sửa thực phẩm', 'en': 'Edit food'},
    'form_add_food': {'vi': 'Thêm thực phẩm', 'en': 'Add food'},
    'form_label_name': {'vi': 'Tên thực phẩm', 'en': 'Food name'},
    'form_name_hint': {'vi': 'Ví dụ: Cà chua', 'en': 'e.g. Tomato'},
    'form_label_quantity': {'vi': 'Số lượng', 'en': 'Quantity'},
    'form_quantity_hint': {'vi': 'Ví dụ: 5', 'en': 'e.g. 5'},
    'form_label_category': {'vi': 'Danh mục', 'en': 'Category'},
    'form_label_expiry': {'vi': 'Ngày hết hạn', 'en': 'Expiry date'},
    'form_label_image': {'vi': 'Ảnh thực phẩm', 'en': 'Food image'},
    'form_image_help': {
      'vi': 'Nhấn vào ảnh để chọn từ thư viện hoặc chụp ảnh bằng camera',
      'en': 'Tap the image to pick from gallery or take a photo',
    },
    'form_save_changes': {'vi': 'Lưu thay đổi', 'en': 'Save changes'},
    'form_add_button': {'vi': 'Thêm thực phẩm', 'en': 'Add food'},
    'form_image_add': {'vi': 'Thêm ảnh', 'en': 'Add image'},

        'msg_name_required': {
      'vi': 'Vui lòng nhập tên thực phẩm',
      'en': 'Please enter food name',
    },
    'msg_quantity_invalid': {
      'vi': 'Số lượng phải lớn hơn 0',
      'en': 'Quantity must be greater than 0',
    },
    'msg_merged_quantity': {
      'vi': 'Tên trùng, đã cộng dồn số lượng',
      'en': 'Duplicate name, quantities merged',
    },
    'msg_updated': {'vi': 'Đã cập nhật thực phẩm', 'en': 'Food updated'},
    'msg_added_to_fridge': {
      'vi': 'Đã thêm vào tủ lạnh',
      'en': 'Added to fridge',
    },
    'msg_quantity_added_to': {
      'vi': 'Đã cộng thêm',
      'en': 'Added',
    },
    'msg_deleted': {'vi': 'Đã xóa', 'en': 'Deleted'},

        'delete_title': {'vi': 'Xóa thực phẩm?', 'en': 'Delete food?'},
    'delete_message': {
      'vi': 'Bạn có chắc muốn xóa khỏi tủ lạnh không?',
      'en': 'Are you sure you want to remove from fridge?',
    },

                'ai_title': {'vi': 'Thư Viện Công Thức', 'en': 'Recipe Library'},
    'ai_search_hint': {
      'vi': 'Tìm kiếm công thức...',
      'en': 'Search recipes...',
    },
    'ai_cat_quick': {'vi': 'Nấu nhanh', 'en': 'Quick cook'},
    'ai_cat_healthy': {'vi': 'Lành mạnh', 'en': 'Healthy'},
    'ai_cat_korean': {'vi': 'Món Hàn', 'en': 'Korean'},
    'ai_minutes': {'vi': 'phút', 'en': 'min'},
    'ai_kcal': {'vi': 'kcal', 'en': 'kcal'},

                'recipe_ingredients': {'vi': 'Nguyên Liệu', 'en': 'Ingredients'},
    'recipe_steps': {'vi': 'Các Bước Thực Hiện', 'en': 'Cooking Steps'},

                'profile_title': {'vi': 'Cá nhân', 'en': 'Profile'},
    'profile_placeholder': {'vi': 'Trang cá nhân', 'en': 'Profile page'},
    'profile_language': {'vi': 'Ngôn ngữ', 'en': 'Language'},
    'profile_vietnamese': {'vi': 'Tiếng Việt', 'en': 'Vietnamese'},
    'profile_english': {'vi': 'Tiếng Anh', 'en': 'English'},

    'profile_section_account': {'vi': 'Tài khoản', 'en': 'Account'},
    'profile_section_settings': {'vi': 'Cài đặt', 'en': 'Settings'},
    'profile_section_security': {'vi': 'Bảo mật', 'en': 'Security'},
    'profile_personal_info': {'vi': 'Thông tin cá nhân', 'en': 'Personal info'},
    'profile_personal_info_desc': {
      'vi': 'Xem thông tin tài khoản của bạn',
      'en': 'View your account details',
    },
    'profile_notifications': {'vi': 'Thông báo', 'en': 'Notifications'},
    'profile_notifications_desc': {
      'vi': 'Quản lý thông báo hết hạn và gợi ý',
      'en': 'Manage expiry alerts & suggestions',
    },
    'profile_change_password': {'vi': 'Đổi mật khẩu', 'en': 'Change password'},
    'profile_change_password_desc': {
      'vi': 'Cập nhật mật khẩu đăng nhập',
      'en': 'Update your login password',
    },
    'profile_logout': {'vi': 'Đăng xuất', 'en': 'Log out'},
    'profile_logout_desc': {
      'vi': 'Thoát khỏi tài khoản hiện tại',
      'en': 'Sign out of your account',
    },
    'profile_delete_account': {'vi': 'Xóa tài khoản', 'en': 'Delete account'},
    'profile_delete_account_desc': {
      'vi': 'Xóa vĩnh viễn tài khoản và dữ liệu',
      'en': 'Permanently delete your account',
    },
    'profile_phone': {'vi': 'Số điện thoại', 'en': 'Phone'},
    'profile_user_id': {'vi': 'Mã tài khoản', 'en': 'Account ID'},
    'profile_email': {'vi': 'Email', 'en': 'Email'},
    'profile_name': {'vi': 'Họ và tên', 'en': 'Full name'},
    'profile_default_avatar': {'vi': 'U', 'en': 'U'},
    'profile_not_logged_in': {
      'vi': 'Bạn chưa đăng nhập',
      'en': 'You are not signed in',
    },
    'profile_logout_confirm': {
      'vi': 'Bạn có chắc muốn đăng xuất?',
      'en': 'Are you sure you want to log out?',
    },
    'profile_delete_confirm': {
      'vi': 'Xóa vĩnh viễn tài khoản của bạn?',
      'en': 'Permanently delete your account?',
    },
    'profile_delete_warning': {
      'vi': 'Hành động này không thể hoàn tác.',
      'en': 'This action cannot be undone.',
    },
    'profile_coming_soon': {
      'vi': 'Tính năng đang phát triển',
      'en': 'Coming soon',
    },
  };

  /// Lấy chuỗi đã dịch theo key. Fallback về key nếu chưa có.
  String text(String key) {
    final entry = _values[key];
    if (entry == null) return key;
    return entry[locale] ?? entry['vi'] ?? key;
  }

  /// Ngôn ngữ hỗ trợ
  static const supportedLocales = ['vi', 'en'];
}
