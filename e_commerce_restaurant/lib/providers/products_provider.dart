import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:e_commerce_restaurant/services/product_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utilities/logger.dart';

final productsListFutureProvider =
    FutureProvider.autoDispose<List<Products>>((ref) async {
  return getProducts();
});

Future<List<Products>> getProducts() async {
  List<Products> fetchedProducts = [];
  try {
    await Future.delayed(const Duration(seconds: 4));
    fetchedProducts = await getIt<ProductServices>().getProducts();
  } on FirebaseException {
    logger.e('FirebaseException: when getting Products');
  } catch (error) {
    logger.e('Catch ERROR: when getting Products');
  }
  return fetchedProducts;
}
