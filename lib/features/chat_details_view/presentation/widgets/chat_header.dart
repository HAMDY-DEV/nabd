import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key, required this.image, required this.name});

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 45.h(context),
        width: 45.h(context),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blackColor,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 10.h(context),
            width: 10.h(context),
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: AppColors.whiteColor),
              shape: BoxShape.circle,
              color: AppColors.greenColor,
            ),
          ),
        ),
      ),
      title: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: getBodyStyle(
          context,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w900,
          fontSize: 14.sp(context),
        ),
      ),
    );
  }
}
