import 'package:flutter/material.dart';
import 'package:movie_app_assignment/common/resources/app_colors.dart';
import 'package:movie_app_assignment/common/resources/app_style.dart';


class CustomFullWidthButtonWidget extends StatelessWidget {
  final Color textColor;
  final Color bgColor;
  final String text;
  const CustomFullWidthButtonWidget({
    required this.textColor,
    required this.bgColor,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: AppColors.green, width: 2),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.downloading_sharp,
            color: textColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: AppStyle.buttonTextStyle.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
