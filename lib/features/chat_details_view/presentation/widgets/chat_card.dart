import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.image,
    required this.message,
    required this.time,
    required this.isMe,
  });

  final String image;
  final String message;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final maxBubbleWidth = MediaQuery.of(context).size.width * 0.68;

    final bubbleColor =
        isMe ? AppColors.primaryColor : AppColors.blackColor.withAlpha(10);

    final textColor = isMe ? AppColors.whiteColor : AppColors.blackColor;

    final bubbleRadius =
        isMe
            ? BorderRadius.only(
              topLeft: Radius.circular(14.r(context)),
              topRight: Radius.circular(6.r(context)),
              bottomLeft: Radius.circular(14.r(context)),
              bottomRight: Radius.circular(14.r(context)),
            )
            : BorderRadius.only(
              topLeft: Radius.circular(6.r(context)),
              topRight: Radius.circular(14.r(context)),
              bottomLeft: Radius.circular(14.r(context)),
              bottomRight: Radius.circular(14.r(context)),
            );

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  
        if (!isMe) _Avatar(image: image),
        if (!isMe) Gap(6.w(context)),

        Flexible(
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxBubbleWidth),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w(context),
                    vertical: 8.h(context),
                  ),
                  decoration: BoxDecoration(
                    color: bubbleColor,
                    borderRadius: bubbleRadius,
                  ),
                  child: Text(
                    message,
                    textDirection: getTextDirection(message),
                    style: getBodyStyle(
                      context,
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp(context),
                    ),
                  ),
                ),
              ),
              Gap(4.h(context)),
              Text(
                time,
                textAlign: isMe ? TextAlign.right : TextAlign.left,
                style: getSmallStyle(
                  context,
                  color: AppColors.blackColor.withAlpha(150),
                ),
              ),
            ],
          ),
        ),

        if (isMe) Gap(6.w(context)),
        if (isMe) _Avatar(image: image),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h(context),
      width: 40.h(context),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
