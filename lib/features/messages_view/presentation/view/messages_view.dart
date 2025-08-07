import 'package:flutter/material.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/functions/routing.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/custom_text_form_field.dart';
import 'package:nabd/features/chat_details_view/presentation/view/chat_details_view.dart';
import 'package:nabd/features/messages_view/presentation/widgets/messages_card.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        title: Text(
          'Messages',
          style: getTitleStyle(
            context,
            fontSize: 20.sp(context),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_square, color: AppColors.blackColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(bottom: 10.h(context)),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.r(context)),
              bottomRight: Radius.circular(40.r(context)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w(context)),
            child: Column(
              children: [
                CustomTextFormField(
                  prefixIcon: Icon(Icons.search, color: AppColors.blackColor),
                  suffixIcon: Icon(Icons.mic_none, color: AppColors.blackColor),
                  hintText: 'Search "Your Frined"',
                  obscureText: false,
                  filled: true,
                  fillColor: AppColors.greyColor.withAlpha(60),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 1.h(context),
                        color: AppColors.blackColor.withAlpha(30),
                      );
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigatorTo(context, const ChatDetailsView());
                        },
                        child: MessagesCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
