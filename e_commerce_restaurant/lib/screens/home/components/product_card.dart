import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';

import '../../../router/app_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productData,
    Key? key,
  }) : super(key: key);

  final ProductData productData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(ProductDetailsRoute(
          product: productData,
        ));
      },
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                productData.imageUrl!,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      productData.title!,
                      style: titleStyle(),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Text(
                      '${productData.price} €',
                      style: headLine2(color: Colors.lime.shade500),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
