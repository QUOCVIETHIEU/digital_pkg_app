import 'package:flutter/material.dart';

class ExpandableHeaderMenu extends StatefulWidget {
  final String headerImageUrl;
  final String heroTag;
  final String headerTitle;
  final List<MenuItem> menuItems;

  const ExpandableHeaderMenu({
    super.key,
    required this.headerImageUrl,
    required this.heroTag,
    required this.headerTitle,
    required this.menuItems,
  });

  @override
  State<ExpandableHeaderMenu> createState() => _ExpandableHeaderMenuState();
}

class _ExpandableHeaderMenuState extends State<ExpandableHeaderMenu> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late final AnimationController _arrowController;
  late final Animation<double> _arrowAnimation;

  // Chiều cao cho header khi đóng/mở
  static const double _headerCollapsedHeight = 120.0;
  static const double _headerExpandedHeight = 250.0;

  @override
  void initState() {
    super.initState();
    _arrowController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    _arrowAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(_arrowController);
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _arrowController.forward();
      } else {
        _arrowController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng AnimatedContainer cho phần header mở rộng thu nhỏ mượt mà.
    return Container(
      margin: const EdgeInsets.all(16),
      // Tạo box có bo góc và shadow nhẹ
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .1), blurRadius: 6)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Phần header: có hình nền, title, Hero effect và icon mũi tên xoay
          GestureDetector(
            onTap: _toggleExpansion,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isExpanded ? _headerExpandedHeight : _headerCollapsedHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(image: NetworkImage(widget.headerImageUrl), fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  // Layer overlay giúp tăng độ tương phản cho tiêu đề
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      gradient: LinearGradient(
                        colors: [Colors.black.withValues(alpha: 0.5), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Tiêu đề Header với hiệu ứng Hero (để chuyển cảnh nếu cần)
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Hero(
                      tag: widget.heroTag,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          widget.headerTitle,
                          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // Icon mũi tên xoay chỉ trạng thái mở/đóng
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: RotationTransition(
                      turns: _arrowAnimation,
                      child: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Nội dung mở rộng: hiển thị menu theo thiết kế hình đính kèm
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: const SizedBox.shrink(),
            secondChild: _buildMenu(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      // Tạo đường viền ngăn menu header với nội dung bên dưới (nếu cần)
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1))),
      child: Column(
        children:
            widget.menuItems.map((item) {
              return InkWell(
                onTap: () {
                  // Gọi callback nếu có, hoặc thêm xử lý khi item được nhấn
                  item.onTap?.call();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  child: Row(
                    children: [
                      Icon(item.icon, color: Colors.black54),
                      const SizedBox(width: 16),
                      Expanded(child: Text(item.title, style: const TextStyle(fontSize: 16, color: Colors.black87))),
                      const Icon(Icons.chevron_right, color: Colors.black38),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}

/// Mô hình cho một menu item
class MenuItem {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  MenuItem({required this.icon, required this.title, this.onTap});
}
