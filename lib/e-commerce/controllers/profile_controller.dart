import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImgpath = ''.obs;

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgpath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
