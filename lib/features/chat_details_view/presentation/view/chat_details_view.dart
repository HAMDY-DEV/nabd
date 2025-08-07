import 'package:flutter/material.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/icon_text_botton.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconTextBotton(
              iconLeft: Icons.arrow_back_ios,
              text: 'Back',
              onTap: () => Navigator.pop(context),
            ),
            Spacer(flex: 2),
            Text(
              'Chat',
              style: getTitleStyle(context, color: AppColors.whiteColor),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
