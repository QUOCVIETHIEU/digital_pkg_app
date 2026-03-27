import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../core/constants/app_route.dart';
import '../../../gen/assets.gen.dart';
import '../bloc/server_config_bloc.dart';

class PageServerConfig extends StatefulWidget {
  const PageServerConfig({super.key});

  @override
  State<PageServerConfig> createState() => _PageServerConfigState();
}

class _PageServerConfigState extends State<PageServerConfig> {
  late TextEditingController _serverEndpointController;
  bool _canSave = false;

  @override
  void initState() {
    _serverEndpointController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _serverEndpointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServerConfigBloc()..add(LoadServerConfig()),
      child: BlocConsumer<ServerConfigBloc, ServerConfigState>(
        listener: (context, state) {
          if (state is ServerConfigLoaded) {
            _serverEndpointController.text = state.url;
            setState(() {
              _canSave = false;
            });
          }
          if (state is ServerConfigPingSuccess) {
            context.popSafety();
            IDialog.showInformationDialog(
              context: context,
              height: 100,
              icon: SvgPicture.asset(Assets.icons.common.icoAccepted),
              title: 'Test Connection Success',
              message:
                  'Đã kết nối thành công tới server, chọn lưu cài đặt để tiếp tục đăng nhập vào hệ thống...',
              onAction: () {
                context.popSafety();
                setState(() {
                  _canSave = true;
                });
              },
            );
          }
          if (state is ServerConfigPingFailure) {
            context.popSafety();
            IDialog.showInformationDialog(
              context: context,
              height: 100,
              icon: SvgPicture.asset(Assets.icons.common.icoCancel),
              title: 'Test Connection Failure',
              message:
                  'Không thể kết nối tới server. Vui lòng kiểm tra đúng địa chỉ url endpoint hoặc liên hệ với bộ phận admin để được hướng dẫn.',
              onAction: () {
                context.popSafety();
                setState(() {
                  _canSave = false;
                });
              },
            );
          }
          if (state is ServerConfigError) {
            context.popSafety();
            IDialog.showErrorMessage(
              context: context,
              title: 'Error',
              message: state.message,
            );
          }
          if (state is ServerConfigSaved) {
            IDialog.showInformationDialog(
              context: context,
              height: 100,
              icon: SvgPicture.asset(Assets.icons.common.icoAccepted),
              title: 'Config Saved',
              dismissible: false,
              message:
                  'Đã lưu cấu hình server thành công, chuyển về màn hình đăng nhập...',
              onAction: () {
                context.popSafety();
                context.pushReplacementNamed(AppRoute.login.name);
              },
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state is ServerConfigLoading;
          bool isSaving = state is ServerConfigSaving;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Center(
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
                          Assets.icons.common.icoServerSetup,
                          height: 80,
                        ),
                      ),

                      /// 02. Title
                      const Text(
                        'Server Configuration',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF123456),
                        ),
                      ),
                      const Text(
                        'Enter the url to connect to the Label Management System',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF123456),
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// 03. Server URL
                      ITextField(
                        readOnly: _canSave,
                        enable: !_canSave,
                        hintText: 'Server url...',
                        defaultText: _serverEndpointController.text,
                        controller: _serverEndpointController,
                        iconNormal: Assets.icons.textfields.icoUrlNormal,
                        iconActive: Assets.icons.textfields.icoUrlActive,
                        radius: 100,
                        thickness: 1.0,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!_canSave)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ), // Button border radius
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: isLoading || isSaving
                                    ? null
                                    : () {
                                        if (_serverEndpointController
                                            .text
                                            .isEmpty) {
                                          IDialog.showErrorMessage(
                                            context: context,
                                            title: 'URL Empty',
                                            message:
                                                'Server url is required...',
                                          );
                                          return;
                                        }
                                        IDialog.showProcessDialog(
                                          context: context,
                                          image: SvgPicture.asset(
                                            Assets
                                                .icons
                                                .common
                                                .icoUpdateDatabase,
                                            width: 24,
                                            height: 24,
                                          ),
                                          title: 'Processing...',
                                          message: 'Processing, please wait...',
                                          backgroundColor:
                                              Colors.blueGrey.shade100,
                                        );
                                        context.read<ServerConfigBloc>().add(
                                          PingServerConfig(
                                            _serverEndpointController.text,
                                          ),
                                        );
                                      },
                                child: isLoading
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text(
                                        'Test Connection',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                              ),
                            if (_canSave)
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ), // Button border radius
                                      backgroundColor: Colors.deepOrange,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _canSave = false;
                                      });
                                    },
                                    child: const Text(
                                      'Reset',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          100.0,
                                        ),
                                      ), // Button border radius
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: isSaving
                                        ? null
                                        : () {
                                            context
                                                .read<ServerConfigBloc>()
                                                .add(
                                                  SaveServerConfig(
                                                    _serverEndpointController
                                                        .text,
                                                  ),
                                                );
                                          },
                                    child: isSaving
                                        ? const SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const Text(
                                            'Save Config',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),

                      TextButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ), // Button border radius
                        ),
                        onPressed: () => context.popSafety(),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.keyboard_backspace,
                              color: Color(0xFF123456),
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Back To Login',
                              style: TextStyle(
                                color: Color(0xFF123456),
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
