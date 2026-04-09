import 'package:flutter/material.dart';

import '../../../core/configs/themes/app_colors.dart';
import '../../../data/auth/models/models.dart';
import '../../../gen/fonts.gen.dart';
import 'switch_role.dart';

class UserDetailList extends StatefulWidget {
  const UserDetailList({super.key, required this.user});
  final UserInfo user;

  @override
  State<UserDetailList> createState() => _UserDetailListState();
}

class _UserDetailListState extends State<UserDetailList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Tab> tabs = [
    const Tab(text: 'Material Manager'),
    const Tab(text: 'Storage Location'),
    const Tab(text: 'Mixing System'),
    const Tab(text: 'Weigher System'),
    const Tab(text: 'Krones System'),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const SizedBox(height: 20),
        const Text(
          'USER ROLE MATRIX',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const Text(
          'Manage account setting and access level',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.blue,
          indicatorWeight: 2,
          labelColor: AppColors.infoColorTab,
          unselectedLabelColor: AppColors.textColor,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.montserrat,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.montserrat,
          ),
          tabs: tabs,

          tabAlignment: TabAlignment.start,
          indicatorPadding: const EdgeInsets.only(bottom: 5.0),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildManageMaterial(context, widget.user),
              _buildStorageLocation(context, widget.user),
              _buildManageMixing(context, widget.user),
              _buildWeigherSystem(context, widget.user),
              _buildKronesSystem(context, widget.user),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildManageMaterial(BuildContext context, UserInfo user) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '01 - Quản Lý Nguyên Liệu',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(
                      title: 'Cho phép tạo cập nhật nhật nguyên liệu',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép xem lịch sử', value: true),
                    SwitchRole(title: 'Cho phép tái sử dụng', value: true),
                    SwitchRole(title: 'Cho phép huỷ Variant', value: true),
                    SwitchRole(title: 'Cho phép cập nhật Variant', value: true),
                    SwitchRole(title: 'Cho phép tạo Variant', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '02 - Quản Lý Bom',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(
                      title: 'Cho phép xem chi tiết B.O.M',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem lịch sử Recipe',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép tái sử dụng Recipe',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem chi tiết Recipe',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép tạo Recipe', value: true),
                    SwitchRole(title: 'Cho phép tạo Variant', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '03 - Quản Lý Process Order',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xem Batch Item', value: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageLocation(BuildContext context, UserInfo user) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '01 - Kho On Hand',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SwitchRole(
                      title: 'Cho phép xem Po Items',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem chi tiết Phiếu Xuất Kho',
                      value: true,
                    ),
                    const SwitchRole(
                      title: 'Cho phép xem chi tiết phiếu đếm xuất Kho',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép chuyển Po', value: true),
                    SwitchRole(title: 'Cho phép đề xuất hoàn kho', value: true),
                    SwitchRole(title: 'Cho phép in nhãn', value: true),
                  ],
                ),
              ),
            ),
          ),
          //ToDO:Fixed return warehouse
          // const Padding(
          //   padding: EdgeInsets.only(top: 20.0, left: 4.0),
          //   child: Text(
          //     '02 - Kho Hoàn Kho',
          //     style: TextStyle(
          //       color: AppColors.textColor,
          //       fontWeight: FontWeight.w600,
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   width: double.infinity,
          //   child: Card(
          //     color: AppColors.cardColorUser,
          //     elevation: 1,
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Column(
          //         children: [
          //           const SwitchRole(
          //             title: 'Cho phép xem Po Items',
          //             value: true,
          //           ),
          //           SwitchRole(
          //             title: 'Cho phép xem chi tiết Phiếu Xuất Kho',
          //             value: true,
          //           ),
          //           const SwitchRole(
          //             title: 'Cho phép xem chi tiết phiếu đếm xuất Kho',
          //             value: true,
          //           ),
          //           SwitchRole(
          //             title: 'Cho phép chuyển Po',
          //             value: true,
          //           ),
          //           SwitchRole(
          //             title: 'Cho phép đề xuất hoàn kho',
          //             value: true,
          //           ),
          //           SwitchRole(
          //             title: 'Cho phép in nhãn',
          //             value: true,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildManageMixing(BuildContext context, UserInfo user) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '01 - Quản Lý pha chế',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xem Reconcile', value: true),
                    SwitchRole(
                      title: 'Cho phép xem xuất Excel Reconcile',
                      value: true,
                    ),
                    const SwitchRole(
                      title: 'Cho phép xác nhận hao hụt NVL',
                      value: true,
                    ),
                    const SwitchRole(
                      title: 'Cho phép xác nhận tiêu thụ NVL',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem lịch sử Reconcile',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem Goods Receipt',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xuất Excel Goods Receipt',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xác nhận Goods Receipt',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem lịch sử Goods Receipt',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem chi tiết Consumption',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xuất Excel Consumption',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xác nhận pha chế Consumption',
                      value: true,
                    ),
                    SwitchRole(
                      title: 'Cho phép xem lịch sử Consumption',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép xem chi tiết mẻ', value: true),
                    SwitchRole(title: 'Cho phép huỷ mẻ', value: true),
                    SwitchRole(title: 'Cho phép tạm dừng', value: true),
                    SwitchRole(title: 'Cho phép tiếp tục', value: true),
                    SwitchRole(
                      title: 'Cho phép chỉnh sửa thông tin mẻ',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép chuyển Po', value: true),
                    SwitchRole(title: 'Cho phép lưu thông tin mẻ', value: true),
                    SwitchRole(title: 'Cho phép di chuyển nhóm', value: true),
                    SwitchRole(title: 'Cho phép thêm nhóm', value: true),
                    SwitchRole(title: 'Cho phép huỷ nhóm', value: true),
                    SwitchRole(title: 'Cho phép sửa nhóm', value: true),
                    SwitchRole(
                      title: 'Cho phép xác nhận thành phẩm',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép thêm mẻ', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '02 - Báo Cáo Tiêu Thụ Đường',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xem xuất Excel', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '03 - Thiết lập hệ thống',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xem mã QR', value: true),
                    SwitchRole(title: 'Cho phép xem Lịch Sử', value: true),
                    SwitchRole(title: 'Cho phép thêm Line', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '04 - Alarm Pending',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xuất Excel', value: true),
                    SwitchRole(title: 'Cho phép xác nhận Alarm', value: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeigherSystem(BuildContext context, UserInfo user) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '01 - Cân Soạn Hàng',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xuất excel', value: true),
                    SwitchRole(title: 'Cho phép xem tạo lệnh cân', value: true),
                    SwitchRole(title: 'Cho phép huỷ lệnh cân', value: true),
                    SwitchRole(
                      title: 'Cho phép cập nhật lệnh cân',
                      value: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '02 - Cân Hoàn Kho',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xuất excel', value: true),
                    SwitchRole(title: 'Cho phép xem tạo phiếu ', value: true),
                    SwitchRole(title: 'Cho phép huỷ phiếu', value: true),
                    SwitchRole(
                      title: 'Cho phép xem chi tiết phiếu',
                      value: true,
                    ),
                    SwitchRole(title: 'Cho phép submit phiếu', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '03 - Báo Cáo Cân',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép xuất excel', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '04 - Thiết Bị',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép thêm trạm cân', value: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKronesSystem(BuildContext context, UserInfo user) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '01 - Edi Outbound',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép export Json', value: true),
                    SwitchRole(title: 'Cho phép xem Import Json', value: true),
                    SwitchRole(title: 'Cho phép xem lich sử EDI', value: true),
                    SwitchRole(title: 'Cho phép retry EDI', value: true),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 4.0),
            child: Text(
              '02 - Edi Inbound',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Card(
              color: AppColors.cardColorUser,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SwitchRole(title: 'Cho phép export Json', value: true),
                    SwitchRole(title: 'Cho phép xem Import Json', value: true),
                    SwitchRole(title: 'Cho phép xem lich sử EDI', value: true),
                    SwitchRole(title: 'Cho phép retry EDI', value: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
