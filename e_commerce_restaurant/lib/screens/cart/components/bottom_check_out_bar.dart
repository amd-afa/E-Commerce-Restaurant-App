import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/router/app_router.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:flutter/material.dart';

class BottomCheckOutBar extends StatelessWidget {
  const BottomCheckOutBar({
    required this.productsId,
    required this.totalSummary,
    Key? key,
  }) : super(key: key);

  final List<String> productsId;
  final double totalSummary;
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Text(
              'Total: $totalSummary€',
              style: headLine2(color: Colors.lime),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              if (productsId.isNotEmpty) {
                AutoRouter.of(context).push(OrdersRoute(
                  productsIdInCart: productsId,
                  totalSummary: totalSummary,
                ));
              } else {
                Flushbar(
                  margin: const EdgeInsets.all(16),
                  messageSize: 18,
                  flushbarPosition: FlushbarPosition.TOP,
                  message: "Bitte mindestens ein Produkt hinzufügen",
                  icon: Icon(
                    Icons.error_outline,
                    size: 28.0,
                    color: Colors.red.shade900,
                  ),
                  duration: const Duration(seconds: 3),
                  leftBarIndicatorColor: Colors.red.shade900,
                ).show(context);
              }
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
                  Text(
                    'Bestellen!',
                    style: titleStyle(color: Colors.white.withOpacity(.9)),
                  ),
                  const SizedBox(width: 22),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white.withOpacity(.9),
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
