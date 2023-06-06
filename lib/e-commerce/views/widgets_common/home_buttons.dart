import 'package:communityapp/e-commerce/const/consts.dart';

Widget homeButtons({width, height, icon, String? title, onpress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 65, height: 80, fit: BoxFit.fill),
      10.heightBox,
      title!.text.fontFamily(semibold).size(17).color(darkFontGrey).make()
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
