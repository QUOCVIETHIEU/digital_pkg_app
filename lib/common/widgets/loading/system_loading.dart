import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';

class SystemLoading extends StatelessWidget {
  const SystemLoading({super.key, this.label = 'Loading...'});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.icons.common.icoUpdateDatabase,
            width: 84,
            height: 84,
          ),
          const SizedBox(height: 8.0),
          Text(label),
        ],
      ),
    );
  }
}
