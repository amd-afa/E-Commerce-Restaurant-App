import 'package:e_commerce_restaurant/resturant_app.dart';
import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const ProviderScope(child: ResturantApp()));
}
