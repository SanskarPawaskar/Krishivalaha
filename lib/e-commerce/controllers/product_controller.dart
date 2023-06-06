import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/e-commerce/const/consts.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;
  var totalprice = 0.obs;
  var isFav = false.obs;

  increaseQuantity(totalquantity) {
    if (quantity.value < totalquantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalprice(price) {
    totalprice.value = price * quantity.value;
    print(totalprice.value);
  }

  addtocart({title, img, seller_name, qty, tprice, context}) async {
    await firestore.collection(cartcollection).doc().set({
      'title': title,
      'img': img,
      'seller_name': seller_name,
      'qty': qty,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetvalue() {
    totalprice.value = 0;
    quantity.value = 0;
  }

  //whistlist

  addToWishlist(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_whishlist': FieldValue.arrayUnion([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Added to Whishlist");
  }

  removeFromWishlist(docId, context) async {
    await firestore.collection(productsCollection).doc(docId).set({
      'p_whishlist': FieldValue.arrayRemove([currentUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Remove from Whishlist");
  }

  checkifFav(data) async {
    if (data['p_whishlist'].contains(currentUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}
