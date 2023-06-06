import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/views/orders_screen/components/order_place_deatils.dart';
import 'package:communityapp/e-commerce/views/orders_screen/components/order_status.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart' as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Order Details',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: const Color(0xff004B20),
          leading: IconButton(
            icon: const Icon(FeatherIcons.chevronLeft,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                orderStatus(
                    color: redColor,
                    icon: Icons.done,
                    title: "placed",
                    showDone: data['order_placed']),
                orderStatus(
                    color: Colors.blue,
                    icon: Icons.thumb_up,
                    title: "Confirmed",
                    showDone: data['order_confirmed']),
                orderStatus(
                    color: Colors.yellow,
                    icon: Icons.car_crash,
                    title: "On Delivery",
                    showDone: data['order_on_delivery']),
                const Divider(),
                10.heightBox,
                Column(
                  children: [
                    orderPlaceDetails(
                      d1: data['order_code'],
                      d2: data['shipping_method'],
                      title1: "Order Code",
                      title2: "Shipping Method",
                    ),
                    orderPlaceDetails(
                      d1: intl.DateFormat()
                          .add_yMd()
                          .format((data['order_date'].toDate())),
                      d2: data['payment_method'],
                      title1: "Order Date",
                      title2: "Payment Method",
                    ),
                    orderPlaceDetails(
                      d1: "Unpaid",
                      d2: "Order Placed",
                      title1: "Payment Status",
                      title2: "Delivery Method",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Shipping Address"
                                  .text
                                  .fontFamily(semibold)
                                  .make(),
                              "${data['order_by_name']}".text.make(),
                              "${data['order_by_email']}".text.make(),
                              "${data['order_by_address']}".text.make(),
                              "${data['order_by_city']}".text.make(),
                              "${data['order_by_state']}".text.make(),
                              "${data['order_by_phone']}".text.make(),
                              "${data['order_by_postalcode']}".text.make(),
                            ],
                          ),
                          SizedBox(
                            width: 130,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Total Amount".text.fontFamily(semibold).make(),
                                "${data['total_amount']}"
                                    .text
                                    .color(redColor)
                                    .fontFamily(bold)
                                    .make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ).box.outerShadowMd.white.make(),
                const Divider(),
                10.heightBox,
                "Ordered Producr"
                    .text
                    .size(16)
                    .color(darkFontGrey)
                    .fontFamily(semibold)
                    .makeCentered(),
                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(data['orders'].length, (index) {
                    return Column(
                      children: [
                        orderPlaceDetails(
                            title1: data['orders'][index]['title'],
                            title2: data['orders'][index]['tprice'],
                            d1: "${data['orders'][index]['qty']}x",
                            d2: "Refundable"),
                      ],
                    );
                  }).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .margin(const EdgeInsets.only(bottom: 4))
                    .make(),
                const Divider(),
                20.heightBox,
              ],
            ),
          ),
        ));
  }
}
