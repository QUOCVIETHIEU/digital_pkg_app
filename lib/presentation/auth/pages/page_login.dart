import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/helpers/utils.dart';
import '../../../common/models/models.dart';
import '../../../common/widgets/dialogs/dialog.dart';
import '../../../common/widgets/textfields/password_text_field.dart';
import '../../../common/widgets/textfields/username_text_field.dart';
import '../../../core/configs/themes/app_colors.dart';
import '../../../core/constants/api_url.dart';
import '../../../core/constants/app_route.dart';
import '../../../core/constants/strings.dart';
import '../../../gen/assets.gen.dart';
import '../../../presentation/auth/bloc/auth_bloc.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isRemember = false;
  Widget _serverConfig(AuthenticationState state) {
    return ApiUrl.baseURL.isEmpty
        ? TextButton(
            onPressed: () {
              context.pushNamed(AppRoute.serverConfig.name);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.icons.common.icoActionSetting,
                  width: 18,
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'Server Configuration',
                  style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                ApiUrl.baseURL.contains('quocviet')
                    ? Assets.logos.logoQuocviet
                    : ApiUrl.baseURL.contains('https://sfi.suntorypepsico.vn')
                    ? Assets.icons.launchers.appLauncherLightSvg
                    : ApiUrl.baseURL.contains(
                        'https://sfi-dev.suntorypepsico.vn',
                      )
                    ? Assets.icons.launchers.appLauncherLightSvg
                    : Assets.icons.error.icNotFound,
                height: 32,
              ),
              const SizedBox(height: 2),
              InkWell(
                onTap: () {
                  context.pushNamed(AppRoute.serverConfig.name);
                },
                child: Text(
                  ApiUrl.baseURL.replaceAll('/api/', ''),
                  style: const TextStyle(
                    color: AppColors.textLevel0,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '${AppInfoModel.instance.shortVersion} (${AppInfoModel.instance.buildNumber})',
              ),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          IDialog.showErrorException(context: context, error: state.error);
        } else if (state is Unauthenticated &&
            state.userInfo.plantArray.isEmpty) {
          IDialog.showInformationDialog(
            context: context,
            title: 'Info',
            message: 'Bạn không được phép truy cập vào nhà máy (plants rỗng)',
            onAction: () => context.popSafety(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Builder(
            builder: (context) {
              if (state is AuthenticationLoadInProgress) {
                return Center(
                  child: IDialog.showWelcomeProgress(context: context),
                );
              }
              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2,
                      vertical: 10.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// 01. Customer Logo
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SvgPicture.asset(
                            Assets.logos.logoSpvb,
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 40.0),

                        /// 02. Login Title
                        const SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Đăng Nhập Để Tiếp Tục',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                AppStrings.appName,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),

                        /// 03. Login Form
                        SizedBox(
                          child: Column(
                            children: [
                              ITextFieldUsername(
                                defaultText: _userNameController.text,
                                enable: ApiUrl.baseURL.isNotEmpty,
                                controller: _userNameController,
                                onSubmitted: (_) => _login(context),
                              ),
                              const SizedBox(height: 10.0),
                              ITextFieldPassword(
                                defaultText: _passwordController.text,
                                enable: ApiUrl.baseURL.isNotEmpty,
                                controller: _passwordController,
                                onSubmitted: (_) => _login(context),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30.0),

                        /// 05. Button Login
                        SizedBox(
                          width: 250, // Set the desired width
                          height: 45, // Set the desired height
                          child: ElevatedButton(
                            onPressed: ApiUrl.baseURL.isEmpty
                                ? null
                                : () => _login(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4178BC),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 15,
                              ), // Button padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ), // Button border radius
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        /// 07. Sever setup
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
          floatingActionButton: Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: _serverConfig(state),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  void _login(BuildContext context) {
    if (_userNameController.text.isEmpty) {
      IDialog.showErrorMessage(
        context: context,
        message: 'Vui lòng nhập username.',
      );
      return;
    } else if (_passwordController.text.isEmpty) {
      IDialog.showErrorMessage(
        context: context,
        message: 'Vui lòng nhập password.',
      );
      return;
    }
    context.read<AuthenticationBloc>().add(
      LoggedIn(
        username: _userNameController.text,
        password: _passwordController.text,
      ),
    );
  }
}
