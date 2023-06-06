import 'package:communityapp/e-commerce/const/consts.dart';

Widget ourButton({onPress, color, textcolor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: redColor,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title!.text.color(textcolor).fontFamily(bold).make(),
  );
}
