import 'package:e_commerce_restaurant/providers/products_provider.dart';
import 'package:e_commerce_restaurant/screens/home/components/products_list.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:e_commerce_restaurant/widgets/loading_widget.dart';
import 'package:e_commerce_restaurant/widgets/lottie_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 23),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime.shade600,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  height: 55,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 12),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Kochboxen finden',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              InkWell(
                onTap: () {
                  //TODO
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lime.shade600,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  width: 50,
                  height: 55,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'Aktuell Kochboxen',
            style: headLine2(),
          ),
          const SizedBox(height: 12),
          Consumer(
            builder: (context, ref, child) {
              final productsListResutl = ref.watch(productsListFutureProvider);
              return productsListResutl.map(data: (data) {
                return ProductsList(productsList: data.value);
              }, error: (error) {
                logger.e(error);
                return const LottieErrorWidget();
              }, loading: (loading) {
                return const LottieLoadingWidget();
              });
            },
          ),
        ],
      ),
    );
  }
}
