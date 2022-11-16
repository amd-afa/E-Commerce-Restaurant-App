import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/utilities/const_firestore.dart';

class ProductServices {
  final FirebaseFirestore _firestore;

  ProductServices(this._firestore);

  // Future<List<Products>> getMainProducts() async {
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
  //       .collection(PRODUCTS_COLLECTION)
  //       //.orderBy("title.createTime", descending: true)
  //       .get();
  //   List<Products> products = querySnapshot.docs
  //       .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
  //           Products.fromDocument(doc))
  //       .toList();
  //   return Products;
  // }
}
