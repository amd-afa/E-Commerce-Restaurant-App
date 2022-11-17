import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    required this.productData,
    Key? key,
  }) : super(key: key);

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: InkWell(
        onTap: () {
          //Todo
        },
        child: Container(
            padding: const EdgeInsets.all(16),
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
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(productData.imageUrl!,
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 150,
                      child: Text(
                        productData.title!,
                        style: subtitleStyle(),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      child: Text(
                        '${productData.price}€',
                        style: titleStyle(color: Colors.lime.shade600),
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
