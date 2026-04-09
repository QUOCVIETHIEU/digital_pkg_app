import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_route.dart';
import '../../../gen/assets.gen.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              width: 500,
              child: SvgPicture.asset(Assets.icons.error.icNotFound),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'PAGE NOT FOUND',
                style: TextStyle(letterSpacing: 4.0, fontSize: 30),
              ),
            ),
            TextButton(
              onPressed: () => context.goNamed(AppRoute.workflow.name),
              child: const Text('Go Back Home'),
            ),
          ],
        ),
      ),
    );
  }
}
