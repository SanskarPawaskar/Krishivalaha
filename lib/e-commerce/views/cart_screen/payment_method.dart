import 'package:communityapp/dashboard/dashboard.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/const/lists.dart';
import 'package:communityapp/e-commerce/controllers/cart_controller.dart';
import 'package:communityapp/e-commerce/views/category_screen/category_screen.dart';

import '../widgets_common/our_buttom.dart';

class Paymnetmethod extends StatelessWidget {
  const Paymnetmethod({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();

    return Obx(
      () => Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            title: "Choose Payment Option"
                .text
                .fontFamily(semibold)
                .color(whiteColor)
                .make(),
          ),
          bottomNavigationBar: SizedBox(
            height: 60,
            child: controller.placingOrder.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ourButton(
                    onPress: () async {
                      await controller.placeMyOrder(
                          orderPaymentMethod:
                              paymentMethods[controller.paymentIndex.value],
                          totalAmount: controller.totalP.value);

                      await controller.clearCart();
                      VxToast.show(context, msg: "Order placed successfully");

                      Navigator.pop(context);
                    },
                    color: Colors.red,
                    textcolor: whiteColor,
                    title: "Place My Order"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Obx(
              () => Column(
                children: List.generate(paymentMethodsimg.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.changePaymentIndex(index);
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: controller.paymentIndex.value == index
                                ? redColor
                                : Colors.transparent,
                            width: 4,
                          )),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.network(paymentMethodsimg[index],
                              width: double.infinity,
                              height: 120,
                              colorBlendMode:
                                  controller.paymentIndex.value == index
                                      ? BlendMode.darken
                                      : BlendMode.color,
                              color: controller.paymentIndex.value == index
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.transparent,
                              fit: BoxFit.cover),
                          controller.paymentIndex.value == index
                              ? Transform.scale(
                                  scale: 1.3,
                                  child: Checkbox(
                                    activeColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                )
                              : Container(),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: paymentMethods[index]
                                .text
                                .white
                                .fontFamily(bold)
                                .size(16)
                                .make(),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          )),
    );
  }
}
