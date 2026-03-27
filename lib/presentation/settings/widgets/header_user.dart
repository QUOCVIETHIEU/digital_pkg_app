import 'package:flutter/widgets.dart';

import '../../../common/widgets/widgets.dart';
import '../../../core/typedefs/type_defs.dart';
import '../../../data/auth/models/models.dart';

class HeaderUser extends StatelessWidget {
  const HeaderUser({super.key, required this.onSearch, required this.users});
  final OnSearchCallback onSearch;
  final List<UserInfo> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildSearch(300)],
    );
  }

  Widget _buildSearch(double width) {
    return Column(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'All Users (${users.length}):',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        ITextFieldSearch(
          value: '',
          size: Size(width, 40),
          radius: 100,
          hintText: 'Nhập tìm kiếm users...',
          onChanged: (s) => onSearch(s),
        ),
      ],
    );
  }
}
