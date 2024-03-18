import 'package:flutter/material.dart';
import 'package:movie_app_assignment/common/resources/app_colors.dart';

class CustomRoundedButtonWidget extends StatelessWidget {
  final String buttonTextName;
  final IconData? icon;
  final Color color;
  final bool isShowBorder;
  final Function()? onTap;
  final IconData? tailingIcon;
  CustomRoundedButtonWidget({
    required this.color,
    required this.isShowBorder,
    required this.buttonTextName,
     this.icon,
    this.tailingIcon,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: isShowBorder
              ? BoxDecoration(
                  border: Border.all(color: AppColors.unselectTabText),
                  borderRadius: BorderRadius.circular(14),
                )
              : null,
          padding: const EdgeInsets.fromLTRB(4, 2, 8, 2),
          child: Row(
            children: [
               if(isShowBorder)
              Icon(
                icon,
                color: color,
              ),
              Text(
                buttonTextName,
                style: TextStyle(color: color, fontSize: 12),
              ),
              if(!isShowBorder)
               Icon(
                tailingIcon,
                color: color,
              )
            ],
          )),
    );
  }
}
