import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/controllers/cart_controller.dart';
import 'package:communityapp/e-commerce/views/cart_screen/Payment_method.dart';
import 'package:communityapp/e-commerce/views/widgets_common/custom_textfield.dart';
import 'package:communityapp/e-commerce/views/widgets_common/our_buttom.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Shippingdetails extends StatelessWidget {
  const Shippingdetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shipping Info".text.color(whiteColor).fontFamily(bold).make(),
        leading: IconButton(
          icon: const Icon(FeatherIcons.chevronLeft,
              size: 30, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff004B20),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
            onPress: () {
              if (controller.addresscontroller.text.length > 10) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Paymnetmethod()));
              } else {
                VxToast.show(context, msg: "Please fill the form");
              }
            },
            color: Colors.red,
            textcolor: whiteColor,
            title: "Continue"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextFiled(
                hint: "Address",
                isPass: false,
                title: "Address",
                controller: controller.addresscontroller),
            customTextFiled(
                hint: "City",
                isPass: false,
                title: "City",
                controller: controller.citycontroller),
            customTextFiled(
                hint: "State",
                isPass: false,
                title: "State",
                controller: controller.statecontroller),
            customTextFiled(
                hint: "Postal Code",
                isPass: false,
                title: "Postal Code",
                controller: controller.postalcontroller),
            customTextFiled(
                hint: "Phone",
                isPass: false,
                title: "Phone",
                controller: controller.phonecontroller),
          ],
        ),
      ),
    );
  }
}
