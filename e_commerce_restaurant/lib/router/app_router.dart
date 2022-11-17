import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/screens/cart/cart_screen.dart';
import 'package:e_commerce_restaurant/screens/home/home_screen.dart';
import 'package:e_commerce_restaurant/screens/orders/orders_screen.dart';
import 'package:e_commerce_restaurant/screens/productdetails/product_details_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<Type>(
      path: '/',
      page: HomeScreen,
    ),
    AutoRoute<Type>(
      path: '/productDetails',
      page: ProductDetailsScreen,
    ),
    AutoRoute<Type>(
      path: '/cart',
      page: CartScreen,
    ),
    AutoRoute<Type>(
      path: '/orders',
      page: OrdersScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
