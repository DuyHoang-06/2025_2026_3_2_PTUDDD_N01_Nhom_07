import 'package:flutter/material.dart';
import '../l10n/app_translations.dart';
import '../models/user.dart';
import '../services/auth_session.dart';
import '../widgets/language_provider.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = LanguageProvider.t(context);
    final languageProvider = LanguageProvider.of(context);
    final user = AuthSession.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xffF7FAF6),
      body: SafeArea(
        child: user == null
            ? _NotLoggedInState(message: tr.text('profile_not_logged_in'))
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _ProfileHeader(user: user)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ).copyWith(top: 8, bottom: 24),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed([
                        _buildInfoSection(context, tr, user),
                        const SizedBox(height: 16),
                        _buildLanguageSection(context, tr, languageProvider),
                        const SizedBox(height: 16),
                        _buildSettingsSection(context, tr),
                        const SizedBox(height: 16),
                        _buildSecuritySection(context, tr),
                        const SizedBox(height: 16),
                        _buildDangerSection(context, tr),
                        const SizedBox(height: 24),
                      ]),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildInfoSection(
    BuildContext context,
    AppTranslations tr,
    User user,
  ) {
    return _SectionCard(
      title: tr.text('profile_section_account'),
      children: [
        _InfoRow(
          label: tr.text('profile_name'),
          value: user.name,
          icon: Icons.person_outline,
        ),
        const _Divider(),
        _InfoRow(
          label: tr.text('profile_email'),
          value: user.email,
          icon: Icons.alternate_email,
        ),
        const _Divider(),
        _InfoRow(
          label: tr.text('profile_phone'),
          value: user.phone ?? '—',
          icon: Icons.phone_outlined,
        ),
        const _Divider(),
        _InfoRow(
          label: tr.text('profile_user_id'),
          value: user.id,
          icon: Icons.fingerprint,
        ),
      ],
    );
  }

  Widget _buildLanguageSection(
    BuildContext context,
    AppTranslations tr,
    LanguageProvider provider,
  ) {
    return _SectionCard(
      title: tr.text('profile_section_settings'),
      children: [
        _ProfileTile(
          icon: Icons.language_outlined,
          iconColor: const Color(0xff4CAF50),
          title: tr.text('profile_language'),
          trailing: Text(
            provider.locale == 'vi'
                ? tr.text('profile_vietnamese')
                : tr.text('profile_english'),
            style: const TextStyle(
              color: Color(0xff657067),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () => _showLanguageSheet(context, tr, provider),
        ),
        const _Divider(),
        _ProfileTile(
          icon: Icons.notifications_none_outlined,
          iconColor: const Color(0xffFF9800),
          title: tr.text('profile_notifications'),
          subtitle: tr.text('profile_notifications_desc'),
          onTap: () => _showComingSoon(context, tr),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context, AppTranslations tr) {
    return _SectionCard(
      title: tr.text('profile_personal_info'),
      children: [
        _ProfileTile(
          icon: Icons.person_pin_outlined,
          iconColor: const Color(0xff2196F3),
          title: tr.text('profile_personal_info'),
          subtitle: tr.text('profile_personal_info_desc'),
          onTap: () => _showUserDetail(context, tr),
        ),
      ],
    );
  }

  Widget _buildSecuritySection(BuildContext context, AppTranslations tr) {
    return _SectionCard(
      title: tr.text('profile_section_security'),
      children: [
        _ProfileTile(
          icon: Icons.lock_outline,
          iconColor: const Color(0xff9C27B0),
          title: tr.text('profile_change_password'),
          subtitle: tr.text('profile_change_password_desc'),
          onTap: () => _showComingSoon(context, tr),
        ),
      ],
    );
  }

  Widget _buildDangerSection(BuildContext context, AppTranslations tr) {
    return _SectionCard(
      children: [
        _ProfileTile(
          icon: Icons.logout,
          iconColor: const Color(0xffE53935),
          title: tr.text('profile_logout'),
          subtitle: tr.text('profile_logout_desc'),
          titleColor: const Color(0xffE53935),
          onTap: () => _confirmLogout(context, tr),
        ),
        const _Divider(),
        _ProfileTile(
          icon: Icons.delete_outline,
          iconColor: const Color(0xffB71C1C),
          title: tr.text('profile_delete_account'),
          subtitle: tr.text('profile_delete_account_desc'),
          titleColor: const Color(0xffB71C1C),
          onTap: () => _confirmDelete(context, tr),
        ),
      ],
    );
  }

  void _confirmLogout(BuildContext context, AppTranslations tr) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr.text('profile_logout')),
        content: Text(tr.text('profile_logout_confirm')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(tr.text('cancel')),
          ),
          TextButton(
            onPressed: () {
              AuthSession.instance.logout();
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
            child: Text(
              tr.text('profile_logout'),
              style: const TextStyle(color: Color(0xffE53935)),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, AppTranslations tr) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(tr.text('profile_delete_account')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tr.text('profile_delete_confirm')),
            const SizedBox(height: 8),
            Text(
              tr.text('profile_delete_warning'),
              style: const TextStyle(
                color: Color(0xffE53935),
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(tr.text('cancel')),
          ),
          TextButton(
            onPressed: () {
              AuthSession.instance.logout();
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
                (route) => false,
              );
            },
            child: Text(
              tr.text('delete'),
              style: const TextStyle(color: Color(0xffB71C1C)),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageSheet(
    BuildContext context,
    AppTranslations tr,
    LanguageProvider provider,
  ) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(top: 8, bottom: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xffE8EEE9),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tr.text('profile_language'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'vi',
                  groupValue: provider.locale,
                  activeColor: const Color(0xff4CAF50),
                  title: Text(tr.text('profile_vietnamese')),
                  onChanged: (v) {
                    provider.setLocale('vi');
                    Navigator.pop(ctx);
                  },
                ),
                RadioListTile<String>(
                  value: 'en',
                  groupValue: provider.locale,
                  activeColor: const Color(0xff4CAF50),
                  title: Text(tr.text('profile_english')),
                  onChanged: (v) {
                    provider.setLocale('en');
                    Navigator.pop(ctx);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUserDetail(BuildContext context, AppTranslations tr) {
    final user = AuthSession.instance.currentUser!;
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xffE8EEE9),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  tr.text('profile_personal_info'),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _InfoRow(
                  label: tr.text('profile_name'),
                  value: user.name,
                  icon: Icons.person_outline,
                ),
                const _Divider(),
                _InfoRow(
                  label: tr.text('profile_email'),
                  value: user.email,
                  icon: Icons.alternate_email,
                ),
                const _Divider(),
                _InfoRow(
                  label: tr.text('profile_phone'),
                  value: user.phone ?? '—',
                  icon: Icons.phone_outlined,
                ),
                const _Divider(),
                _InfoRow(
                  label: tr.text('profile_user_id'),
                  value: user.id,
                  icon: Icons.fingerprint,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showComingSoon(BuildContext context, AppTranslations tr) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(tr.text('profile_coming_soon'))),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;
  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final initial = user.name.isEmpty ? 'U' : user.name[0].toUpperCase();
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff4CAF50), Color(0xff2E7D32)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.white,
            child: Text(
              initial,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff2E7D32),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (user.phone != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    user.phone!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String? title;
  final List<Widget> children;

  const _SectionCard({this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE8EEE9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3022),
                ),
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _ProfileTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: titleColor ?? const Color(0xff1D3022),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff657067),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            trailing ??
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xffB0B8B0),
                  size: 22,
                ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xff657067)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xff9AA39A),
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff1D3022),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 1,
      color: const Color(0xffF1F4F1),
    );
  }
}

class _NotLoggedInState extends StatelessWidget {
  final String message;
  const _NotLoggedInState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.account_circle_outlined,
              size: 80,
              color: Color(0xffB0B8B0),
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xff657067),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}