import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    required this.productsList,
    Key? key,
  }) : super(key: key);

  final List<Products> productsList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // We turn off List view scrolling cuz we have singleChildScroll
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int position) {
          return ProductCard(productData: productsList[position].data!);
        });
  }
}
