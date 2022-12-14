import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/utilities/const/const_firestore.dart';

class ProductServices {
  final FirebaseFirestore _firestore;

  ProductServices(this._firestore);

  Future<List<Products>> getProducts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection(PRODUCTS_COLLECTION).get();
    List<Products> products = querySnapshot.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
            Products.fromDocument(doc))
        .toList();
    return products;
  }
}
