import 'dart:io';

import 'package:emart_app/controller/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.profileImgPath.isEmpty
              ? Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make()
              : Image.file(File(controller.profileImgPath.value)),
          10.heightBox,
          ourButton(
              color: blueColor,
              onPress: () {
                controller.changeImage(context);
              },
              textColor: whiteColor,
              title: "Modifier"),
          Divider(),
          20.heightBox,
          customTextField(
            hint: nameHint,
            title: name,
            isPass: false,
          ),
          customTextField(
            hint: passwordHint,
            title: password,
            isPass: true,
          ),
          20.heightBox,
          SizedBox(
            width: context.screenWidth - 60,
            child: ourButton(
                color: blueColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Enregistrer"),
          ),
        ],
      )
          .box
          .white
          .shadowSm
          .padding(EdgeInsets.all(16))
          .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
          .rounded
          .make(),
    ));
  }
}