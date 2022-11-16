import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<Type>(
      path: '/',
      page: HomeScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
