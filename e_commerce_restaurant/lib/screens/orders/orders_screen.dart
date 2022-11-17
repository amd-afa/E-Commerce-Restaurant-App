import 'package:e_commerce_restaurant/screens/orders/components/body.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({
    required this.productsIdInCart,
    required this.totalSummary,
    Key? key,
  }) : super(key: key);

  final List<String> productsIdInCart;
  final double totalSummary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(),
      body: SafeArea(
        child: OrdersBody(
          productsIdInCart: productsIdInCart,
          totalSummary: totalSummary,
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Bestellen'),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Icon(Icons.info),
          ),
        )
      ],
    );
  }
}
