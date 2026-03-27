import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/models/drawer_model.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../common/models/models.dart';
import '../../../core/constants/constants.dart';
import '../../../data/support/models/models.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../bloc/support_bloc.dart';

class SupportHomePage extends StatefulWidget {
  const SupportHomePage({super.key});

  static DrawerModel get drawer => Drawers.drawers.firstWhere(
    (element) => element.route == AppRoute.support,
  );

  @override
  State<SupportHomePage> createState() => _SupportHomePageState();
}

class _SupportHomePageState extends State<SupportHomePage> {
  Future<void> _openCompanySite(String? website) async {
    if (website == null || website.isEmpty) return;
    final uri = Uri.parse(website);
    if (!await launchUrl(uri)) {
      return;
    }
  }

  @override
  void initState() {
    context.read<SupportBloc>().add(const SupportLoadRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<SupportBloc, SupportState>(
      listener: (context, state) {
        if (state.status == Status.loading) {
          IDialog.showDialogLoading(context: context);
        } else if (state.status == Status.loaded) {
          context.popSafety();
        } else if (state.status == Status.error) {
          context.popSafety();
          IDialog.showErrorException(context: context, error: state.error!);
        }
      },
      builder: (context, state) {
        return DefaultTextStyle(
          style: const TextStyle(fontFamily: FontFamily.montserrat),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 900;

                final leftContent = Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isNarrow ? 360 : 520,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: SvgPicture.asset(
                            Assets.icons.support.icoSupport,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                );

                final rightContent = Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Chip(text: 'Suntory Pepsico'),
                      const SizedBox(height: 16),
                      Text(
                        'Customer',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF0A4C8A),
                        ),
                      ),
                      Text(
                        'Support',
                        style: theme.textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF0A4C8A),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Contact US',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF3DD4E0),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _ServiceDeskUser(supportInfo: state.supportInformation),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          const _BrandDot(),
                          const SizedBox(width: 12),
                          Flexible(
                            child: _VendorInfo(
                              vendorInfo: state.vendorInformation,
                              onWebsiteTap: _openCompanySite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IgnorePointer(
                          child: SvgPicture.asset(
                            Assets.icons.support.icoFrameTopRight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IgnorePointer(
                          child: SvgPicture.asset(
                            Assets.icons.support.icoFrameBottomRight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!isNarrow) Expanded(flex: 6, child: leftContent),
                        if (!isNarrow)
                          const VerticalDivider(
                            width: 1,
                            color: Colors.transparent,
                          ),
                        Expanded(
                          flex: isNarrow ? 1 : 5,
                          child: isNarrow
                              ? SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 32,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 260, child: leftContent),
                                      const SizedBox(height: 24),
                                      rightContent,
                                    ],
                                  ),
                                )
                              : rightContent,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF3DD4E0),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ) ??
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Colors.black87,
      fontWeight: FontWeight.w600,
    );
    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: '$label: '),
          TextSpan(
            text: value,
            style: style?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _BrandDot extends StatelessWidget {
  const _BrandDot();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF3B4651),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(Assets.logos.logoQuocviet, width: 32, height: 32),
    );
  }
}

class _ServiceDeskUser extends StatelessWidget {
  const _ServiceDeskUser({required this.supportInfo});

  final SupportInformation? supportInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        spacing: 4.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            supportInfo?.supporterFullName ?? 'None',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          _InfoRow(
            label: 'Phone',
            value: supportInfo?.supporterPhone ?? 'None',
          ),
          _InfoRow(
            label: 'Email',
            value: supportInfo?.supporterEmail ?? 'None',
          ),
        ],
      ),
    );
  }
}

class _VendorInfo extends StatelessWidget {
  const _VendorInfo({required this.vendorInfo, required this.onWebsiteTap});
  final VendorInformation? vendorInfo;
  final void Function(String?) onWebsiteTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vendorInfo?.website ?? 'None',
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            text: 'Copyright © ${(DateTime.now().year)} ',
            children: [
              WidgetSpan(
                child: InkWell(
                  onTap: () => onWebsiteTap(vendorInfo?.website),
                  hoverColor: Colors.transparent,
                  child: Text(
                    vendorInfo?.vendorName ?? 'Quoc Viet company',
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
            style: const TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.montserrat,
            ),
          ),
        ),
      ],
    );
  }
}
