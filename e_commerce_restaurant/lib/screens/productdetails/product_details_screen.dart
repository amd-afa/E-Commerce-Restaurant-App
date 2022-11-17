import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/screens/productdetails/components/body.dart';
import 'package:e_commerce_restaurant/screens/productdetails/components/bottom_add_to_cart_bar.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductData product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomAddToCartBar(
        product: product,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: ProductDetailsBody(
          product: product,
        )),
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
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Icon(Icons.share_outlined),
          ),
        )
      ],
    );
  }
}
