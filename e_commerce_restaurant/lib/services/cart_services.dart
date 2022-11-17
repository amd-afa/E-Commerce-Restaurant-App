import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/utilities/const/const_firestore.dart';

class CartServices {
  final FirebaseFirestore _firestore;

  CartServices(this._firestore);

  Future<List<Products>> getProductsFromCart() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection(CART_COLLECTION).get();
    List<Products> products = querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
            Products.fromDocument(doc))
        .toList();
    return products;
  }

  Future<void> addProductToCart({required Products product}) async {
    DocumentReference<Object?> docRef =
        _firestore.collection(CART_COLLECTION).doc(product.data!.id);
    return docRef.set(product.toJson());
  }
}
