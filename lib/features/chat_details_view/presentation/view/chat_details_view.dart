import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/core/widgets/icon_text_botton.dart';
import 'package:nabd/features/chat_details_view/presentation/widgets/chat_card.dart';
import 'package:nabd/features/chat_details_view/presentation/widgets/chat_header.dart';

class ChatDetailsView extends StatelessWidget {
  const ChatDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
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
        body: Column(
          children: [
            ChatHeader(
              image:
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              name: 'Hamdy Fathy',
            ),
            Gap(10.h(context)),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r(context)),
                        topRight: Radius.circular(20.r(context)),
                      ),
                    ),
                    child: ListView.separated(
                      reverse: true,
                      padding: EdgeInsets.only(
                        left: 20.w(context),
                        right: 20.w(context),
                        bottom: 60.h(context),
                        top: 20.h(context),
                      ),
                      itemBuilder: (context, index) {
                        return ChatCard(
                          isMe: index % 2 == 0,
                          time: '10:00 am',
                          message:
                              'how are you how are you how are you how are you how are you',
                          image:
                              'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        );
                      },
                      separatorBuilder: (context, index) => Gap(10.h(context)),
                      itemCount: 10,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.h(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r(context)),
                          topRight: Radius.circular(10.r(context)),
                        ),
                        color: AppColors.whiteColor.withAlpha(230),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r(context)),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
