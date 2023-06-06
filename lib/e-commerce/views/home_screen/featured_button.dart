import 'package:communityapp/e-commerce/const/consts.dart';

Widget featureButton({String? title, icon}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 140, fit: BoxFit.fill),
      20.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .margin(const EdgeInsets.symmetric(horizontal: 6))
      .white
      .padding(const EdgeInsets.all(10))
      .roundedSM
      .outerShadowSm
      .make();
}
