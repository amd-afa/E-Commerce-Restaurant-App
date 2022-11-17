import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/orders/orders.dart';
import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:e_commerce_restaurant/services/orders_services.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final submitOrderFutureProvider =
    FutureProvider.autoDispose.family<void, Orders>((ref, orders) async {
  return submitOrder(orders: orders);
});

Future<void> submitOrder({required Orders orders}) async {
  try {
    await Future.delayed(const Duration(seconds: 3));
    await getIt<OrdersServices>().submitOrders(orders: orders);
  } on FirebaseException {
    logger.e('FirebaseException: when submiting orders');
  } catch (error) {
    logger.e('Catch ERROR: when submiting orders');
  }
}
