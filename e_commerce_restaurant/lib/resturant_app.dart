import 'package:e_commerce_restaurant/utilities/text_style.dart';
import 'package:flutter/material.dart';

import 'router/app_router.dart';

class ResturantApp extends StatefulWidget {
  const ResturantApp({Key? key}) : super(key: key);

  @override
  State<ResturantApp> createState() => _ResturantAppState();
}

class _ResturantAppState extends State<ResturantApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      color: Colors.lightGreen,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      title: 'Resturant App',
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      // home: const HomeScreen(),
    );
  }

  ThemeData appTheme() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        toolbarHeight: 150,
        titleTextStyle: headLine1,
        titleSpacing: 4.5,
        shadowColor: Colors.lightGreen,
        backgroundColor: Colors.black54,
        actionsIconTheme: IconThemeData(
          color: Colors.lime.shade500,
          size: 32,
        ),
      ),
    );
  }
}
