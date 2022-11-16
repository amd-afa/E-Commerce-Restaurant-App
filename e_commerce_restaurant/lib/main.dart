import 'package:e_commerce_restaurant/resturant_app.dart';
import 'package:e_commerce_restaurant/services/firebase_services.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const ResturantApp());
}
