import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/services/cart_services.dart';
import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsInCartFutureProvider =
    FutureProvider.autoDispose<List<Products>>((ref) async {
  return getProductsInCart();
});

Future<List<Products>> getProductsInCart() async {
  List<Products> fetchedProducts = [];
  try {
    await Future.delayed(const Duration(seconds: 4));
    fetchedProducts = await getIt<CartServices>().getProductsFromCart();
  } on FirebaseException {
    logger.e('FirebaseException: when getting Products in cart');
  } catch (error) {
    logger.e('Catch ERROR: when getting Products in cart');
  }
  return fetchedProducts;
}

final addProductToCartFutureProvider =
    FutureProvider.autoDispose.family<void, Products>((ref, product) async {
  return addProductToCart(product: product);
});

Future<void> addProductToCart({required Products product}) async {
  try {
    await getIt<CartServices>().addProductToCart(product: product);
  } on FirebaseException {
    logger.e('FirebaseException: when adding Product to cart');
  } catch (error) {
    logger.e('Catch ERROR: when adding Product to cart');
  }
}
