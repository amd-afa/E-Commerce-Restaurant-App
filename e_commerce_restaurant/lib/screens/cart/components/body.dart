import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/screens/cart/components/cart_list.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    required this.products,
    Key? key,
  }) : super(key: key);

  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CartList(
        productsList: products,
      ),
    );
  }
}
