import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/e-commerce/const/consts.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  var addresscontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var statecontroller = TextEditingController();
  var postalcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var paymentIndex = 0.obs;

  late dynamic productSnapshot;
  var products = [];

  var placingOrder = false.obs;

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    placingOrder(true);

    final userDoc =
        await firestore.collection('users').doc(currentUser!.uid).get();
    final username = userDoc.data()?['username'];
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': "233981237",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': username,
      'order_by_email': currentUser!.email,
      'order_by_address': addresscontroller.text,
      'order_by_state': statecontroller.text,
      'order_by_city': citycontroller.text,
      'order_by_phone': phonecontroller.text,
      'order_by_postalcode': postalcontroller.text,
      'shipping_method': "Home Delivery",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_on_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
    placingOrder(false);
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'img': productSnapshot[i]['img'],
        'tprice': productSnapshot[i]['tprice'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }

    print(products);
  }

  clearCart() {
    for (var i = 0; i < productSnapshot.length; i++) {
      firestore.collection(cartcollection).doc(productSnapshot[i].id).delete();
    }
  }
}
