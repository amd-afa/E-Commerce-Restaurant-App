import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/models/orders/orders.dart';
import 'package:e_commerce_restaurant/utilities/const/const_firestore.dart';

class OrdersServices {
  final FirebaseFirestore _firestore;

  OrdersServices(this._firestore);

  Future<void> submitOrders({required Orders orders}) async {
    DocumentReference<Object?> docRef =
        _firestore.collection(ORDERS_COLLECTION).doc();
    return docRef.set(orders.toJson());
  }
}
