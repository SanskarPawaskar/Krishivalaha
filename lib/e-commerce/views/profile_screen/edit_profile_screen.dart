import 'dart:io';

import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/views/widgets_common/our_buttom.dart';


import '../../controllers/profile_controller.dart';
import '../widgets_common/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImgpath.isEmpty
                  ? Image.asset(imgstud, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : Image.file(
                      File(controller.profileImgpath.value),
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: redColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                  textcolor: whiteColor,
                  title: "change"),
              const Divider(),
              20.heightBox,
              customTextFiled(hint: nameHint, title: name, isPass: false),
              customTextFiled(hint: password, title: password, isPass: true),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 60,
                child: ourButton(
                    color: redColor,
                    onPress: () {},
                    textcolor: whiteColor,
                    title: "save"),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ));
  }
}
