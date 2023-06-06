import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/controllers/product_controller.dart';
import 'package:communityapp/e-commerce/services/commerce_service.dart';
import 'package:communityapp/e-commerce/views/category_screen/item_details.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGrey,
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
          backgroundColor: const Color(0xff004B20),
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirestoreServices.getProducts(title),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: "No products found".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshot.data!.docs;
                return Container(
                    color: const Color(0xffEEFABE),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 215,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_imgs'][0],
                                    height: 110,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  5.heightBox,
                                  "${data[index]['p_name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .size(14)
                                      .color(darkFontGrey)
                                      .make(),
                                  5.heightBox,
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
                                      "${data[index]['p_price']}"
                                          .numCurrency
                                          .text
                                          .color(redColor)
                                          .fontFamily(bold)
                                          .fontWeight(FontWeight.bold)
                                          .size(16)
                                          .make(),
                                    ],
                                  )
                                ],
                              )
                                  .box
                                  .white
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 9))
                                  .roundedSM
                                  .outerShadowLg
                                  .padding(const EdgeInsets.all(15))
                                  .make()
                                  .onTap(() {
                                controller.checkifFav(data[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              title: "${data[index]['p_name']}",
                                              data: data[index],
                                            )));
                                // Get.to(() => ItemDetails(
                                //       title: "${data[index]['p_name']}",
                                //       data: data[index],
                                //     ));
                              });
                            })
                      ],
                    ));
              }
            },
          ),
        ));
  }
}
