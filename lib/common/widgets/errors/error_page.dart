import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../models/network.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});
  final AppException error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 250.0,
              width: 250.0,
              child: SvgPicture.asset(Assets.icons.error.icErrorRobot),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 140.0,
                  child: SvgPicture.asset(
                    Assets.logos.logoSpvb,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${error.response?.statusCode}. ',
                      style: const TextStyle(
                        fontFamily: FontFamily.montserrat,
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'That\'s an error!',
                          style: TextStyle(
                            fontFamily: FontFamily.montserrat,
                            fontWeight: FontWeight.w600,
                            color: Colors.lightBlue,
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  error.customMessage ?? error.message ?? '',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: Color(0xFFDA0022),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
