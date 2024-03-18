import 'package:flutter/material.dart';
import 'package:movie_app_assignment/common/resources/app_colors.dart';


class AppStyle {
  //app bar text style
  static var appBarTextStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: AppColors.white);
 static var buttonTextStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.green);
       static var roundCornerbuttonTextStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.unselectTextColor);
        static var customTextStyle = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey);
       static var headerTextStyle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black);
}