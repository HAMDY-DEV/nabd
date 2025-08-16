import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:nabd/core/constants/assets_images.dart';
import 'package:nabd/core/functions/open_camara.dart';
import 'package:nabd/core/functions/show_snack_and_lottie.dart';
import 'package:nabd/core/util/colors.dart';
import 'package:nabd/core/util/responsive_layout.dart';
import 'package:nabd/core/util/text_style.dart';
import 'package:nabd/features/create_post/presentation/manager/create_post_cubit.dart';
import 'package:nabd/features/create_post/presentation/manager/create_post_state.dart';
import 'package:nabd/features/create_post/presentation/widgets/button_upload_photo.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({super.key});

  final TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = CreatePostCubit.get(context);
    return BlocListener<CreatePostCubit, CreatePostState>(
      listenWhen: (previous, current) {
        if (current is CreatePostSuccess ||
            current is CreatePostError ||
            current is CreatePostLoading) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          Navigator.pop(context);
          showsSnackBar(context: context, text: 'post created successfully');
          descriptionController.clear();
          cubit.photo = null;
        } else if (state is CreatePostError) {
          showsSnackBar(context: context, text: 'error');
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              size: 30.r(context),
              color: AppColors.whiteColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            'Create New Post',
            style: getTitleStyle(context, color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }
                cubit.createPost(description: descriptionController.text);
              },
              child: Text(
                'Post',
                style: getBodyStyle(context, color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(16.h(context)),
            margin: EdgeInsets.only(top: 10.h(context)),
            decoration: BoxDecoration(
              color: Color(0xfff9f9f9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r(context)),
                topRight: Radius.circular(30.r(context)),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(10.h(context)),

                  Card(
                    color: AppColors.whiteColor,
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(16.h(context)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Gap(10.w(context)),
                              CircleAvatar(
                                backgroundImage: AssetImage(Assets.onboarding3),
                                radius: 25.r(context),
                              ),
                              Gap(10.w(context)),
                              Text(
                                'Hamdy Fathy',
                                style: getBodyStyle(
                                  context,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ],
                          ),
                          Gap(10.h(context)),

                          TextFormField(
                            controller: descriptionController,
                            onChanged: (value) {
                              (context as Element).markNeedsBuild();
                            },
                            textAlign: TextAlign.start,
                            textDirection: getTextDirection(
                              descriptionController.text,
                            ),
                            maxLines: 8,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What\'s on your mind?',
                            ),
                          ),
                          Gap(10.h(context)),
                        ],
                      ),
                    ),
                  ),
                  Gap(10.h(context)),
                  BlocBuilder<CreatePostCubit, CreatePostState>(
                    buildWhen: (previous, current) {
                      if (current is ChangePhoto) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return cubit.photo != null
                          ? Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.r(context),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Image.file(
                                  fit: BoxFit.fill,
                                  // height: 150,
                                  // width: 100,
                                  File(cubit.photo!),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: GestureDetector(
                                    onTap: () => cubit.changePhoto(null),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 20.r(context),
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container();
                    },
                  ),
                  Gap(10.h(context)),
                  ButtonUploadPhoto(
                    onTap: () async {
                      cubit.changePhoto(
                        await OpenCameraAndvideo.uploadImagesGallery(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
