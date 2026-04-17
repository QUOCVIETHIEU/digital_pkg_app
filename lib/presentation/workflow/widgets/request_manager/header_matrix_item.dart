import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/helpers/utils.dart';
import '../../../../common/widgets/widgets.dart';
import '../../../../core/configs/themes/app_colors.dart';
import '../../../../gen/assets.gen.dart';

class HeaderMatrixItem extends StatelessWidget {
  const HeaderMatrixItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 36.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.icons.drawers.icoDrawerSapBanner),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'SAP INTEGRATION STATUS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      IRectangleButton(
                        onPressed: () {},
                        leading: SvgPicture.asset(
                          Assets.icons.actions.icoActionSend,
                        ),
                        title: 'SEND EDI',
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        backgroundColor: AppColors.workFlowTextGlobalApproved,
                        outlineColor: AppColors.workFlowTextGlobalApproved,
                        textColor: AppColors.primary,
                        enableVerticalDivider: false,
                        buttonPadding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 10,
                        ),
                        height: 28,
                        padding: EdgeInsets.zero,
                      ),
                      Container(
                        height: 28,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundEdi,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.borderEdi,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.drawers.icoDrawerClock,
                            ),
                            Text(
                              'Wait to Send EDI',
                              style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textEdi,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          InkWell(
            onTap: () => context.popSafety(),
            child: SvgPicture.asset(
              Assets.icons.common.icoActionClose,
              width: 28,
              height: 28,
            ),
          ),
        ],
      ),
    );
  }
}
