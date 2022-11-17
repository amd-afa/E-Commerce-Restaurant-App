import 'package:e_commerce_restaurant/providers/cart_provider.dart';
import 'package:e_commerce_restaurant/screens/cart/components/body.dart';
import 'package:e_commerce_restaurant/screens/cart/components/bottom_check_out_bar.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:e_commerce_restaurant/widgets/loading_widget.dart';
import 'package:e_commerce_restaurant/widgets/lottie_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  double totalSummary = 0.0;
  List<String> productsIdInCart = [];
  Widget bodyWidget = const LottieLoadingWidget();

  @override
  Widget build(BuildContext context) {
    final productsInCartResutl = ref.watch(productsInCartFutureProvider);
    bodyWidget = productsInCartResutl.map(data: (data) {
      for (var element in data.value) {
        productsIdInCart.add(element.data!.id!);
        totalSummary = totalSummary + element.data!.price!;
      }
      return CartBody(products: data.value);
    }, error: (error) {
      logger.e(error);
      return const LottieErrorWidget();
    }, loading: (loading) {
      return const LottieLoadingWidget();
    });
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomCheckOutBar(
        productsId: productsIdInCart,
        totalSummary: totalSummary,
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: bodyWidget),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('Warenkorb'),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: const Icon(Icons.delete_outline),
          ),
        )
      ],
    );
  }
}
