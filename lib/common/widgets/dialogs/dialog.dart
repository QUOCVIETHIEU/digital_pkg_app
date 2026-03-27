import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';

import '../../../common/helpers/utils.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/strings.dart';
import '../../../domain/common/repositories/common.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../presentation/auth/bloc/auth_bloc.dart';
import '../../../service_locator.dart';
import '../../models/app_info_model.dart';
import '../../models/network.dart';
import '../loading/system_loading_dialog.dart';

class IDialog {
  /// CUSTOM DIALOG
  static Future<bool?> showConfirmLogout(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Row(
            children: [
              Icon(Icons.exit_to_app_rounded, color: AppColors.iconColor),
              SizedBox(width: 10),
              Text(
                'Thoát ứng dụng?',
                style: TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 16,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Text(
                  'Xác nhận thoát?',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Huỷ'),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Thoát'),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showAboutDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  Assets.icons.launchers.appLauncher,
                  width: 64.0,
                  height: 64.0,
                ),
              ),
              const Text(
                AppStrings.appGroup,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Text(
                url,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text(
                AppStrings.appName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
              Text(
                '${AppInfoModel.instance.fullVersion} (${AppInfoModel.instance.buildNumber})',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 13.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Copyright © ${DateTime.now().year} Quoc Viet Co.,Ltd',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12.0),
              ),
              const SizedBox(height: 24.0),
              Container(
                width: 180,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                child: ElevatedButton(
                  onPressed: () => context.popSafety(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color(0xFF0E69CC),
                  ),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// PROCESS DIALOG
  static void showProcessDialog({
    required BuildContext context,
    required Widget image,
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    image,
                    const SizedBox(width: 20),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: CircularProgressIndicator(
                    color: AppColors.mosquittoColor,
                  ),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget showCircularProgressWithIcon({
    required BuildContext context,
    required String label,
    required Widget image,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: 64,
              height: 64,
              child: CircularProgressIndicator(
                color: Color(0xFF069F97),
                strokeWidth: 3.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: image,
            ), // Hiển thị hình ảnh ở giữa
          ],
        ),
        const SizedBox(height: 15.0),
        Text(label, style: const TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }

  static Widget showCircularProgress({
    required BuildContext context,
    Widget? image,
    required String label,
    double strokeWidth = 3,
    Size size = const Size(24, 24),
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ?image,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: CircularProgressIndicator(
              color: AppColors.mosquittoColor,
              strokeWidth: strokeWidth,
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  static Widget showWelcomeProgress({required BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.icons.launchers.appLauncherLightSvg,
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 12),
            const Text(
              'SYRUP\nMIXING\nSYSTEM',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '© Suntory Pepsico Viet Nam',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              Text(
                '${AppInfoModel.instance.fullVersion} (Build ${AppInfoModel.instance.buildNumber})',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
              IDialog.showCircularProgress(
                context: context,
                label: 'Connect to server, please wait...',
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(const LoggedOut());
                },
                child: const Text(
                  'Quay Lại',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// DIALOGS
  static void showErrorMessage({
    required BuildContext context,
    String title = 'Lỗi',
    required String message,
    String labelButton = 'Đóng',
    bool dismissible = false,
    VoidCallback? onAction,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.errorColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: FontFamily.montserrat,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 2.5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    message,
                    textAlign: TextAlign.start,
                    maxLines: 15,
                    style: const TextStyle(
                      fontFamily: FontFamily.montserrat,
                      fontSize: 12,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                labelButton,
                style: const TextStyle(
                  fontFamily: FontFamily.montserrat,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                if (onAction != null) onAction();
                context.popSafety();
              },
            ),
          ],
        );
      },
    );
  }

  static void showErrorException({
    required BuildContext context,
    String title = 'Lỗi',
    required AppException error,
    String labelButton = 'Đóng',
    bool dismissible = false,
    VoidCallback? onAction,
  }) {
    showDialog(
      context: context,
      barrierDismissible: error.isExpireToken ? false : dismissible,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.errorColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: FontFamily.montserrat,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 2.5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    error.customMessage ?? 'Lỗi không xác định',
                    textAlign: TextAlign.start,
                    maxLines: 15,
                    style: const TextStyle(
                      fontFamily: FontFamily.montserrat,
                      fontSize: 12,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                labelButton,
                style: const TextStyle(
                  fontFamily: FontFamily.montserrat,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              onPressed: () {
                if (onAction != null) onAction();
                if (error.response?.statusCode == 401) {
                  sl.get<AuthenticationBloc>().add(const LoggedOut());
                }
                context.popSafety();
              },
            ),
            if (error.isResultCodeWarning)
              TextButton(
                child: const Text(
                  'Chấp nhận',
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                onPressed: () {
                  context.popSafety();
                  sl
                      .get<CommonRepository>()
                      .enableBypassWarningByResultCodesList(
                        error.resultCode ?? [],
                      );
                },
              ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog({
    required BuildContext context,
    Widget? icon,
    required String title,
    required String message,
    String leftButtonName = 'Đóng',
    String rightButtonName = 'Xác nhận',
    required VoidCallback onAction,
    VoidCallback? onLeftAction,
    bool isDismissible = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Row(
            children: [
              icon ?? const Icon(Icons.info_outline_rounded),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: FontFamily.montserrat,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Text(
                  message,
                  textAlign: TextAlign.start,
                  maxLines: 15,
                  style: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            // Left Action Button
            TextButton(
              child: Text(
                leftButtonName,
                style: const TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.popSafety();
                if (onLeftAction != null) {
                  onLeftAction();
                }
              },
            ),

            // Right Action Button
            TextButton(
              child: Text(
                rightButtonName,
                style: const TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.popSafety();
                onAction();
              },
            ),
          ],
        );
      },
    );
  }

  static void showInformationDialog({
    required BuildContext context,
    Widget? icon,
    required String title,
    required String message,
    double height = 100,
    double maxHeight = 450,
    bool dismissible = false,
    String labelButton = 'Đóng',
    required VoidCallback onAction,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: Row(
            children: [
              icon ?? const Icon(Icons.info_outline),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: FontFamily.montserrat,
                ),
              ),
            ],
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 3,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10.0),
                Text(
                  message,
                  textAlign: TextAlign.start,
                  maxLines: 30,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    fontFamily: FontFamily.montserrat,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(child: Text(labelButton), onPressed: () => onAction()),
          ],
        );
      },
    );
  }

  /// PROCESS DIALOG
  static void showNetworkException({
    required BuildContext context,
    required AppException error,
  }) {
    if (ModalRoute.of(context)?.isCurrent == true &&
        context.canPop() &&
        ModalRoute.of(context) is DialogRoute) {
      context.popSafety();
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Row(
            children: [
              Icon(Icons.error, color: AppColors.errorColor, size: 20),
              SizedBox(width: 10),
              Text(
                'Error',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width / 2.5,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Text(
                    '${error.response?.statusCode}: ${error.customMessage}',
                    textAlign: TextAlign.start,
                    maxLines: 15,
                    style: const TextStyle(
                      fontFamily: FontFamily.montserrat,
                      fontSize: 12,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.popSafety();
                if (error.response?.statusCode == 401) {
                  sl.get<AuthenticationBloc>().add(const LoggedOut());
                }
              },
            ),
          ],
        );
      },
    );
  }

  /// SNACK BARS
  static void showSnackSuccess({
    required BuildContext context,
    required String message,
    String? description,
    Widget? icon,
    Widget? closeAction,
    Color? backgroundColor,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    int secondDuration = 3,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior,
        backgroundColor: backgroundColor ?? AppColors.successColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        duration: Duration(seconds: secondDuration),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon ??
                    SvgPicture.asset(
                      Assets.icons.common.icoMessage,
                      width: 16,
                      height: 16,
                    ),
                const SizedBox(width: 8),
                Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: FontFamily.montserrat,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            InkWell(
              child: SvgPicture.asset(
                Assets.icons.common.icoClearSnack,
                width: 16,
                height: 16,
              ),
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackInfo({
    required BuildContext context,
    required String message,
    String? description,
    Widget? icon,
    Widget? closeAction,
    Color? backgroundColor,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    int secondDuration = 3,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior,
        backgroundColor: backgroundColor ?? AppColors.warningColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        duration: Duration(seconds: secondDuration),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon ??
                    SvgPicture.asset(
                      Assets.icons.common.icoMessage,
                      width: 16,
                      height: 16,
                    ),
                const SizedBox(width: 8),
                Text(
                  message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: FontFamily.montserrat,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            InkWell(
              child:
                  closeAction ??
                  SvgPicture.asset(
                    Assets.icons.common.icoClearSnack,
                    width: 16,
                    height: 16,
                  ),
              onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            ),
          ],
        ),
      ),
    );
  }

  static void showSnackExported({
    required BuildContext context,
    String? message,
    String? filePath,
    String? description,
    Widget? icon,
    Color? backgroundColor,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
    int secondDuration = 5,
  }) {
    if (!ResponsiveUtil.isDesktopDevice) {
      return;
    }
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior,
        backgroundColor: backgroundColor ?? AppColors.successColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        duration: Duration(seconds: secondDuration),
        content: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon ??
                    SvgPicture.asset(
                      Assets.icons.common.icoMessage,
                      width: 16,
                      height: 16,
                    ),
                const SizedBox(width: 8),
                Text(
                  message ?? 'Thông báo: Xuất file thành công!',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    fontFamily: FontFamily.montserrat,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),

            InkWell(
              onTap: () async {
                if (filePath == null || filePath.isEmpty) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    IDialog.showSnackInfo(
                      context: context,
                      message: 'Không có đường dẫn file để mở.',
                    );
                  }
                  return;
                }

                final result = await OpenFile.open(filePath);
                if (result.type != ResultType.done) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    IDialog.showSnackInfo(
                      context: context,
                      message: result.message.isNotEmpty
                          ? 'Không thể mở file: ${result.message}'
                          : 'Không thể mở file này. Vui lòng kiểm tra lại ($filePath).',
                    );
                  }
                }
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: const Text('Xem file'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showConfirmExitDialog({
    required BuildContext context,
    required VoidCallback onAction,
    VoidCallback? onLeftAction,
    bool isDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Row(
            children: [
              Icon(Icons.warning, color: AppColors.warningColor, size: 20),
              SizedBox(width: 10),
              Text(
                'Warning',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontFamily: FontFamily.montserrat,
                ),
              ),
            ],
          ),
          content: const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Dữ liệu đang nhập có thể bị mất, bạn có muốn tiếp tục?',
                  textAlign: TextAlign.start,
                  maxLines: 15,
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: 12,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            // Left Action Button
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.popSafety();
                if (onLeftAction != null) {
                  onLeftAction();
                }
              },
            ),

            // Right Action Button
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontFamily: FontFamily.montserrat,
                  fontSize: 12,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {
                context.popSafety();
                onAction();
              },
            ),
          ],
        );
      },
    );
  }

  /// COMMON DIALOG
  static Future<T?> showCommonAnimationDialog<T>({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = false,
    Color? backgroundColor,
    ShapeBorder? shape,
    Clip? clipBehavior,
    EdgeInsets? insetPadding,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve transitionCurve = Curves.easeInOut,
    Offset beginOffset = const Offset(0, 1), // Slide from bottom
  }) {
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: transitionDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return SafeArea(
          child: Builder(
            builder: (context) => Dialog(
              backgroundColor: backgroundColor,
              shape: shape,
              clipBehavior: clipBehavior ?? Clip.none,
              insetPadding:
                  insetPadding ??
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
              child: content,
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: transitionCurve,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset,
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static Future<T?> showCommonDialog<T>({
    required BuildContext context,
    required Widget content,
    bool barrierDismissible = true,
    Color? backgroundColor,
    ShapeBorder? shape,
    Clip? clipBehavior,
    EdgeInsets? insetPadding,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve transitionCurve = Curves.easeInOut,
    Offset beginOffset = const Offset(0, 1), // Slide from bottom
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: backgroundColor,
          shape: shape,
          clipBehavior: clipBehavior ?? Clip.none,
          insetPadding:
              insetPadding ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: content,
        );
      },
    );
  }

  static Future<T?> showDialogLoading<T>({
    required BuildContext context,
    Widget? content,
    bool barrierDismissible = false,
    Color? backgroundColor,
    ShapeBorder? shape,
    Clip? clipBehavior,
    EdgeInsets? insetPadding,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Curve transitionCurve = Curves.easeInOut,
    Offset beginOffset = const Offset(0, 1), // Slide from bottom
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: backgroundColor,
          shape: shape,
          clipBehavior: clipBehavior ?? Clip.none,
          insetPadding:
              insetPadding ??
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: content ?? const SystemLoadingDialog(),
        );
      },
    );
  }

  static Future<T?> showDialogActions<T>({
    required BuildContext context,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
    VoidCallback? onMoveUp,
    VoidCallback? onMoveDown,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          child: Container(
            width: 320,
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 20.0,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Color(0xFF3A3E43), Color(0xFF262D2E)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chọn Hành Động',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(thickness: 0.5, color: Colors.white),

                // 01. Edit  Value
                InkWell(
                  onTap: onEdit,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 18, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Chỉnh Sửa Nguyên Liệu',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                // 02. Delete Material
                InkWell(
                  onTap: onDelete,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Xóa Nguyên Liệu',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                // move up
                if (onMoveUp != null)
                  InkWell(
                    onTap: onMoveUp,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Di chuyển Lên',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                // move down
                if (onMoveDown != null)
                  InkWell(
                    onTap: onMoveDown,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Di chuyển Xuống',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
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
