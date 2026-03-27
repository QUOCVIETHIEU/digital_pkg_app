import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/auth/models/user_info.dart';
import '../../../gen/assets.gen.dart';
import '../../../presentation/auth/bloc/auth_bloc.dart';
import '../dialogs/dialog.dart';
import '../dialogs/dlg_change_password.dart';
import '../painters/notched_border_painter.dart';

class IAvatarNotchedMenu extends StatefulWidget {
  const IAvatarNotchedMenu({super.key, required this.user, required this.size});
  final Size size;
  final UserInfo? user;

  @override
  State<IAvatarNotchedMenu> createState() => _IAvatarNotchedMenuState();
}

class _IAvatarNotchedMenuState extends State<IAvatarNotchedMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      // Đẩy menu cách widget một chút để notch hiện rõ
      offset: const Offset(0, 20),
      color: Colors.white,
      elevation: 4,
      shape: const NotchedBorder(
        borderRadius: 8,
        notchWidth: 14,
        notchHeight: 8,
        notchPosition: 0.8,
      ),
      onSelected: (value) async {
        final authBloc = context.read<AuthenticationBloc>();
        if (value == 1) {
          showDialog(
            context: context,
            builder: (c) => Dialog(
              clipBehavior: Clip.hardEdge,
              child: RepositoryProvider(
                create: (context) => authBloc,
                child: DlgChangePassword(userInfo: widget.user!),
              ),
            ),
          );
        } else if (value == 2) {
          final confirmed = await IDialog.showConfirmLogout(context);
          if (confirmed == true) {
            authBloc.add(const LoggedOut());
          }
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.icons.common.icoAvatar,
                  width: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user?.fullName ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.user?.email ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        widget.user?.fullRoleName ?? 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              SvgPicture.asset(
                Assets.icons.common.icoActionExit,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              const Text(
                'Thoát Ứng Dụng',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.icons.common.icoAvatar,
            width: widget.size.width,
            height: widget.size.height,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 5),
          Text(
            widget.user?.fullName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
