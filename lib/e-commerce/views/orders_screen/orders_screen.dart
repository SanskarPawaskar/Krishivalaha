import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:communityapp/e-commerce/services/commerce_service.dart';
import 'package:communityapp/e-commerce/views/orders_screen/orders_details.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class OrdersScreen extends StatelessWidget {
  final Key? key;

  const OrdersScreen({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
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
      body: StreamBuilder(
        stream: FirestoreServices.getAllOrders(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No orders yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: "${index + 1}"
                            .text
                            .fontFamily(bold)
                            .color(darkFontGrey)
                            .xl
                            .make(),
                        title: data[index]['order_code']
                            .toString()
                            .text
                            .color(redColor)
                            .fontFamily(semibold)
                            .make(),
                        subtitle: data[index]['total_amount']
                            .toString()
                            .numCurrency
                            .text
                            .fontFamily(bold)
                            .make(),
                        trailing: IconButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         OrdersDetails(data: data[index]),
                              //   ),
                              // );
                              // Get.to(() => OrdersDetails(data: data[index]));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OrdersDetails(data: data[index])));
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: darkFontGrey,
                            )),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
