import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_restaurant/services/firebase_options.dart';
import 'package:e_commerce_restaurant/services/product_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

registeredServices() {
  getIt.registerSingleton(ProductServices(FirebaseFirestore.instance));
}

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  registeredServices();
}
