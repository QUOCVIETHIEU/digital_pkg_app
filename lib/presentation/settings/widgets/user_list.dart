import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../data/auth/models/models.dart';

class UserList extends StatefulWidget {
  const UserList({
    super.key,
    required this.users,
    this.selectedUser,
    this.onUserSelected,
  });

  final List<UserInfo> users;
  final UserInfo? selectedUser;
  final ValueChanged<UserInfo>? onUserSelected;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final ScrollController _scrollController = ScrollController();
  final Random _random = Random();
  final Map<String, Color> _colorCache = {};

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Map<String, List<UserInfo>> _groupUsersByFirstLetter() {
    final Map<String, List<UserInfo>> grouped = {};
    for (final user in widget.users) {
      final firstLetter = _getFirstLetter(user.fullName);
      grouped.putIfAbsent(firstLetter, () => []).add(user);
    }
    // Sort each group
    for (final key in grouped.keys) {
      grouped[key]!.sort((a, b) => a.fullName.compareTo(b.fullName));
    }
    return grouped;
  }

  String _getFirstLetter(String name) {
    if (name.isEmpty) return '#';
    // Get the first non-space character
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '#';
    return trimmed[0].toUpperCase();
  }

  Color _getAvatarColor(String letter) {
    if (_colorCache.containsKey(letter)) {
      return _colorCache[letter]!;
    }

    final hue = _random.nextDouble() * 360;
    final saturation = 30 + _random.nextDouble() * 40;
    final lightness = 75 + _random.nextDouble() * 15;

    final color = HSLColor.fromAHSL(
      1.0,
      hue,
      saturation / 100,
      lightness / 100,
    ).toColor();

    _colorCache[letter] = color;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    final groupedUsers = _groupUsersByFirstLetter();
    final sortedKeys = groupedUsers.keys.toList()..sort();

    if (widget.users.isEmpty) {
      return const Center(
        child: Text(
          'Không có người dùng',
          style: TextStyle(fontSize: 14, color: AppColors.textLevel2),
        ),
      );
    }

    return ScrollbarTheme(
      data: const ScrollbarThemeData(
        thickness: WidgetStatePropertyAll(6.0),
        radius: Radius.circular(3.0),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          itemCount: _getTotalItemCount(groupedUsers, sortedKeys),
          itemBuilder: (context, index) {
            return _buildItem(context, index, groupedUsers, sortedKeys);
          },
        ),
      ),
    );
  }

  int _getTotalItemCount(
    Map<String, List<UserInfo>> groupedUsers,
    List<String> sortedKeys,
  ) {
    int count = 0;
    for (final key in sortedKeys) {
      count += 1;
      count += groupedUsers[key]!.length;
    }
    return count;
  }

  Widget _buildItem(
    BuildContext context,
    int index,
    Map<String, List<UserInfo>> groupedUsers,
    List<String> sortedKeys,
  ) {
    int currentIndex = 0;
    for (final key in sortedKeys) {
      if (index == currentIndex) {
        return _buildSectionHeader(key);
      }
      currentIndex++;

      final users = groupedUsers[key]!;
      for (final user in users) {
        if (index == currentIndex) {
          return _buildUserItem(user);
        }
        currentIndex++;
      }
    }
    return const SizedBox.shrink();
  }

  Widget _buildSectionHeader(String letter) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: AppColors.cardColorUser,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          letter,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildUserItem(UserInfo user) {
    final isSelected = widget.selectedUser?.id == user.id;
    final firstLetter = _getFirstLetter(user.fullName);
    final avatarColor = _getAvatarColor(firstLetter);

    return InkWell(
      onTap: () => widget.onUserSelected?.call(user),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.blue.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),

          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: avatarColor,
                child: Text(
                  firstLetter,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.accessLevel.name.isEmpty
                          ? 'Unknown Role Name'
                          : user.accessLevel.toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.textLevel2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
