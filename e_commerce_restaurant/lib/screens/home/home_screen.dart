import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/router/app_router.dart';
import 'package:e_commerce_restaurant/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const SingleChildScrollView(
        child: SafeArea(child: HomeBody()),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Freshii'),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: const Icon(Icons.favorite_border),
          ),
        ),
        InkWell(
          onTap: () {
            AutoRouter.of(context).push(const CartRoute());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: const Icon(Icons.shopping_cart_outlined),
          ),
        )
      ],
    );
  }
}
