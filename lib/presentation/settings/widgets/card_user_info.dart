import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/widgets/widgets.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/constants.dart';
import '../../../data/auth/models/models.dart';
import '../../../gen/assets.gen.dart';
import '../../../service_locator.dart';
import '../../bloc.dart';

class UserInfoCard extends StatefulWidget {
  final UserInfo user;
  final List<AccessLevel> levels;

  const UserInfoCard({super.key, required this.user, required this.levels});

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  late bool isEditing;
  late AccessLevel selectedAccessLevel;

  @override
  void initState() {
    super.initState();
    isEditing = false;
    selectedAccessLevel = widget.user.accessLevel;
  }

  @override
  void didUpdateWidget(UserInfoCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.user.id.toLowerCase() != widget.user.id.toLowerCase()) {
      selectedAccessLevel = widget.user.accessLevel;
      isEditing = false;
    }
  }

  Widget userInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Expanded(
            child: SelectableText(value, style: const TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.all(0),
      elevation: 1,
      color: const Color(0xFFF0F4F4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Center(
                child: SvgPicture.asset(
                  Assets.icons.common.icoUserMan,
                  width: 140,
                ),
              ),
            ),

            // Details Section
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    widget.user.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  userInfo('Bộ phận: ', widget.user.department.name),
                  userInfo('Mã nhân viên: ', widget.user.userName),
                  Visibility(
                    visible: !isEditing,
                    child: userInfo('Email: ', widget.user.email),
                  ),

                  // View Profile Button
                  Row(
                    children: [
                      // Access Level
                      Visibility(
                        visible: !isEditing,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            widget.user.accessLevel.toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                      //  Edit Button
                      Visibility(
                        visible: isEditing,
                        child: Builder(
                          builder: (context) {
                            return SizedBox(
                              width: 220,
                              child: IDropdownBasic<AccessLevel>(
                                listItems: widget.levels,
                                initialItem: selectedAccessLevel,
                                searchHintText: 'Tìm kiếm',
                                onItemSelected: (accessLevel) {
                                  setState(() {
                                    selectedAccessLevel = accessLevel;
                                  });
                                },
                              ),
                            );
                          },
                        ),
                      ),

                      // Save Button
                      const SizedBox(width: 8),
                      Visibility(
                        visible: sl<AccessUtils>().isCanUpdateRole,
                        child: Row(
                          children: [
                            Visibility(
                              visible: !isEditing,
                              child: InkWell(
                                onTap: () => setState(() => isEditing = true),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 14.0,
                                        color: AppColors.textColor,
                                      ),
                                      Text(
                                        '  Sửa  ',
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: isEditing,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        isEditing = false;
                                        selectedAccessLevel =
                                            widget.user.accessLevel;
                                      });
                                    },
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: isEditing
                                          ? const Row(
                                              children: [
                                                Icon(
                                                  Icons.close,
                                                  size: 18.0,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  ' Huỷ ',
                                                  style: TextStyle(
                                                    color: AppColors.textColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const Icon(
                                              Icons.edit,
                                              size: 14.0,
                                              color: AppColors.textColor,
                                            ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final updatedUser = widget.user.copyWith(
                                        accessLevel: selectedAccessLevel,
                                      );

                                      context.read<SettingHomeBloc>().add(
                                        SettingUserRoleUpdated(updatedUser),
                                      );

                                      setState(() {
                                        isEditing = false;
                                      });
                                    },
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: isEditing
                                          ? const Row(
                                              children: [
                                                Icon(
                                                  Icons.save,
                                                  size: 18.0,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  ' Lưu ',
                                                  style: TextStyle(
                                                    color: AppColors.textColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const Icon(
                                              Icons.edit,
                                              size: 14.0,
                                              color: AppColors.textColor,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
