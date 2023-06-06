import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/const/lists.dart';
import 'package:communityapp/e-commerce/controllers/product_controller.dart';
import 'package:communityapp/e-commerce/views/widgets_common/our_buttom.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;
  const ItemDetails({Key? key, required this.title, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return WillPopScope(
      onWillPop: () async {
        controller.resetvalue();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: title!.text.fontFamily(bold).make(),
          backgroundColor: const Color(0xff004B20),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            Obx(
              () => IconButton(
                  onPressed: () {
                    if (controller.isFav.value) {
                      controller.removeFromWishlist(data.id, context);
                    } else {
                      controller.addToWishlist(data.id, context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: controller.isFav.value ? redColor : whiteColor,
                  )),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //swiper section

                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        aspectRatio: 16 / 9,
                        itemCount: data['p_imgs'].length,
                        viewportFraction: 1.0,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data["p_imgs"][index],
                            width: double.infinity,
                            fit: BoxFit.fill,
                          );
                        }),

                    10.heightBox,
                    //title and details screen
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(bold)
                        .make(),
                    10.heightBox,
                    //rating
                    VxRating(
                      isSelectable: false,
                      value: double.parse(data['p_rating']),
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      maxRating: 5,
                    ),

                    10.heightBox,
                    Row(
                      children: [
                        const Text(
                          '\u20B9',
                          style: TextStyle(
                            color: redColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        "${data['p_price']}"
                            .numCurrency
                            .text
                            .color(redColor)
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                      ],
                    ),

                    10.heightBox,

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "${data['p_seller']}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .size(16)
                                .make(),
                          ],
                        ),
                        /*const CircleAvatar(
                          backgroundColor: Colors.white,
                          child:
                              Icon(Icons.message_rounded, color: darkFontGrey),
                        )*/
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),

                    10.heightBox,

                    //quantity row
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: "Quantity: ".text.color(darkFontGrey).make(),
                        ),
                        Obx(
                          () => Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller.decreaseQuantity();
                                    controller.calculateTotalprice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(Icons.remove)),
                              controller.quantity.value.text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {
                                    controller.increaseQuantity(
                                        int.parse(data['p_quatity']));

                                    controller.calculateTotalprice(
                                        int.parse(data['p_price']));
                                  },
                                  icon: const Icon(Icons.add)),
                              10.widthBox,
                              "(${data['p_quatity']} available)"
                                  .text
                                  .color(textfieldGrey)
                                  .make(),
                            ],
                          ),
                        ),
                      ],
                    ).box.padding(const EdgeInsets.all(8)).make(),

                    //total row
                    Obx(
                      () => Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total: ".text.color(darkFontGrey).make(),
                          ),
                          "${controller.totalprice.value}"
                              .numCurrency
                              .text
                              .color(redColor)
                              .size(16)
                              .fontFamily(bold)
                              .make(),
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ),
                    10.heightBox,

                    //description section

                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "${data['p_desc']}".text.color(darkFontGrey).make(),

                    //button section
                    10.heightBox,

                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          itemDetailsButtonsList.length,
                          (index) => ListTile(
                                title: itemDetailsButtonsList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),
                    20.heightBox,

                    //products you may like

                    // productsyoumaylike.text
                    //     .fontFamily(bold)
                    //     .size(16)
                    //     .color(darkFontGrey)
                    //     .make(),
                    // 10.heightBox,
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //       children: List.generate(
                    //     6,
                    //     (index) => Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Image.asset(
                    //           imgpest,
                    //           width: 130,
                    //           fit: BoxFit.cover,
                    //         ),
                    //         10.heightBox,
                    //         "Pesticide"
                    //             .text
                    //             .fontFamily(semibold)
                    //             .color(fontGrey)
                    //             .make(),
                    //         10.heightBox,
                    //         "\$600"
                    //             .text
                    //             .color(redColor)
                    //             .fontFamily(bold)
                    //             .size(16)
                    //             .make(),
                    //         10.heightBox,
                    //       ],
                    //     )
                    //         .box
                    //         .white
                    //         .margin(const EdgeInsets.symmetric(horizontal: 4))
                    //         .roundedSM
                    //         .padding(const EdgeInsets.all(8))
                    //         .make(),
                    //   )),
                    // )
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ourButton(
                  color: redColor,
                  onPress: () {
                    if (controller.quantity.value > 0) {
                      controller.addtocart(
                          context: context,
                          img: data['p_imgs'][0],
                          qty: controller.quantity.value,
                          seller_name: data['p_seller'],
                          title: data['p_name'],
                          tprice: controller.totalprice.value);
                      VxToast.show(context, msg: "Added to cart");
                    } else {
                      VxToast.show(context,
                          msg: "Minimum 1 Product is required");
                    }
                  },
                  textcolor: whiteColor,
                  title: "Add to cart"),
            )
          ],
        ),
      ),
    );
  }
}
