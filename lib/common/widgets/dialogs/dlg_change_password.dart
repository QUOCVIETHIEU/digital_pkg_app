import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/helpers/utils.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../data/auth/models/user_info.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../presentation/auth/bloc/auth_bloc.dart';
import '../textfields/password_text_field.dart';
import '../textfields/username_text_field.dart';
import 'dialog.dart';

class DlgChangePassword extends StatefulWidget {
  const DlgChangePassword({super.key, required this.userInfo});

  final UserInfo userInfo;

  @override
  State<DlgChangePassword> createState() => _DlgChangePasswordState();
}

class _DlgChangePasswordState extends State<DlgChangePassword> {
  late TextEditingController _oldPasswordController,
      _newPasswordController,
      _confirmNewPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoadInProgress) {
          IDialog.showDialogLoading(context: context);
        } else if (state is AuthenticationError) {
          context.popSafety();
          IDialog.showErrorException(context: context, error: state.error);
        }
      },
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width / 2,
            maxHeight: MediaQuery.sizeOf(context).height,
          ),
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 01. Title
                const Text(
                  'THAY ĐỔI MẬT KHẨU',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // 02. Content
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: SvgPicture.asset(
                    Assets.icons.common.icoSignupPanel,
                    height: 140,
                  ),
                ),

                /// 03. Login Form
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 01. User name
                      const Text(
                        '1. Tên nhân viên (*): ',
                        style: TextStyle(
                          fontFamily: FontFamily.montserrat,
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: ITextFieldUsername(
                          hintText: '',
                          defaultText: widget.userInfo.fullName,
                          readOnly: true,
                          controller: TextEditingController(
                            text: widget.userInfo.fullName,
                          ),
                        ),
                      ),

                      // 02. Old password
                      const Text(
                        '2. Mật khẩu cũ (*): ',
                        style: TextStyle(
                          fontFamily: FontFamily.montserrat,
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: ITextFieldPassword(
                          hintText: 'Nhập mật khẩu cũ...',
                          defaultText: '',
                          controller: _oldPasswordController,
                        ),
                      ),

                      // 03. New password
                      const Text(
                        '3. Mật khẩu mới (*): ',
                        style: TextStyle(
                          fontFamily: FontFamily.montserrat,
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: ITextFieldPassword(
                          hintText: 'Nhập mật khẩu mới...',
                          defaultText: '',
                          controller: _newPasswordController,
                        ),
                      ),

                      // 04. Confirm new password
                      const Text(
                        '4. Nhập lại mật khẩu mới (*): ',
                        style: TextStyle(
                          fontFamily: FontFamily.montserrat,
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 15.0),
                        child: ITextFieldPassword(
                          hintText: 'Nhập lại mật khẩu mới...',
                          defaultText: '',
                          controller: _confirmNewPasswordController,
                        ),
                      ),
                    ],
                  ),
                ),

                // 03. Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.popSafety(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.all(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            ' Huỷ ',
                            style: TextStyle(
                              fontFamily: FontFamily.montserrat,
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () async {
                          // 01. Check username empty
                          if (widget.userInfo.userName.isEmpty) {
                            IDialog.showErrorMessage(
                              context: context,
                              message: 'Mã nhân viên đang rỗng!',
                            );
                            return;
                          }

                          // 02. Check old password empty
                          if (_oldPasswordController.text.isEmpty) {
                            IDialog.showErrorMessage(
                              context: context,
                              message: 'Chưa nhập mật khẩu cũ!',
                            );
                            return;
                          }

                          // 03. Check new password empty
                          if (_newPasswordController.text.isEmpty) {
                            IDialog.showErrorMessage(
                              context: context,
                              message: 'Chưa nhập mật khẩu mới!',
                            );
                            return;
                          }

                          // 04. Check confirm new password empty
                          if (_confirmNewPasswordController.text.isEmpty) {
                            IDialog.showErrorMessage(
                              context: context,
                              message:
                                  'Chưa nhập trường xác nhận lại mật khẩu mới!',
                            );
                            return;
                          }

                          // 05. Check new password and confirm new password are the same
                          if (_newPasswordController.text !=
                              _confirmNewPasswordController.text) {
                            IDialog.showErrorMessage(
                              context: context,
                              message:
                                  'Mật khẩu mới và mật khẩu xác nhận không giống nhau!',
                            );
                            return;
                          }

                          context.read<AuthenticationBloc>().add(
                            UpdatePasswordEvent(
                              userId: context.userId,
                              currentPassword: _oldPasswordController.text,
                              newPassword: _newPasswordController.text,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mosquittoColor,
                          padding: const EdgeInsets.all(8.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Đổi Mật Khẩu',
                            style: TextStyle(
                              fontFamily: FontFamily.montserrat,
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
