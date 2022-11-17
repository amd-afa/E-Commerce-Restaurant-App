import 'package:another_flushbar/flushbar.dart';
import 'package:e_commerce_restaurant/models/metadata.dart';
import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:e_commerce_restaurant/models/products/products.dart';
import 'package:e_commerce_restaurant/providers/cart_provider.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class BottomAddToCartBar extends ConsumerWidget {
  const BottomAddToCartBar({
    required this.product,
    Key? key,
  }) : super(key: key);

  final ProductData product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.8),
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 26),
          InkWell(
            onTap: () async {
              Products products = Products(
                  data: product, metadata: Metadata(createdTime: '2022.11.17'));
              AsyncValue<void> addToCartResponse =
                  ref.watch(addProductToCartFutureProvider(
                products,
              )); //test
              addToCartResponse.map(data: (data) {
                return Flushbar(
                  margin: const EdgeInsets.all(16),
                  messageSize: 18,
                  flushbarPosition: FlushbarPosition.TOP,
                  message: "Hinzugefügt",
                  icon: Icon(
                    Icons.check,
                    size: 28.0,
                    color: Colors.green[300],
                  ),
                  duration: const Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.green[300],
                )..show(context);
              }, error: (error) {
                logger.e(error);
                return Flushbar(
                  margin: const EdgeInsets.all(16),
                  messageSize: 18,
                  flushbarPosition: FlushbarPosition.TOP,
                  message: "Fehler beim hinzufügen!",
                  icon: Icon(
                    Icons.error_outline,
                    size: 28.0,
                    color: Colors.red.shade900,
                  ),
                  duration: const Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.red.shade900,
                )..show(context);
              }, loading: (loading) {
                return Flushbar(
                  margin: const EdgeInsets.all(16),
                  messageSize: 18,
                  flushbarPosition: FlushbarPosition.TOP,
                  message: "${product.title} wird in Warenkorb hinzugefügt!",
                  icon: Lottie.network(
                      'https://assets1.lottiefiles.com/private_files/lf30_yo2zavgg.json'),
                  duration: const Duration(seconds: 4),
                  leftBarIndicatorColor: Colors.lime.shade500,
                )..show(context);
              });
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.lime,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white.withOpacity(.9),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'In Warenkorb legen',
                    style: titleStyle(color: Colors.white.withOpacity(.9)),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              '${product.price}€',
              style: headLine2(color: Colors.lime),
            ),
          ),
        ],
      ),
    );
  }
}
