import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 23),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              product.imageUrl!,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            product.title!,
            style: headLine2(),
          ),
          const SizedBox(height: 18),
          Text(
            product.description!,
            style: titleStyle(),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
