// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:e_commerce_restaurant/models/metadata.dart';
import 'package:e_commerce_restaurant/models/orders/order_data.dart';
import 'package:e_commerce_restaurant/models/orders/orders.dart';
import 'package:e_commerce_restaurant/providers/orders_provider.dart';
import 'package:e_commerce_restaurant/router/app_router.dart';
import 'package:e_commerce_restaurant/utilities/logger.dart';
import 'package:e_commerce_restaurant/utilities/style/text_style.dart';
import 'package:e_commerce_restaurant/widgets/resutrant_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class OrdersBody extends ConsumerStatefulWidget {
  const OrdersBody({
    required this.productsIdInCart,
    required this.totalSummary,
    Key? key,
  }) : super(key: key);

  final List<String> productsIdInCart;
  final double totalSummary;

  @override
  ConsumerState<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends ConsumerState<OrdersBody> {
  bool bottonEnabled = false;
  TextEditingController textEditingControllerCustomerName =
      TextEditingController();
  TextEditingController textEditingControllerCustomerAddress =
      TextEditingController();
  TextEditingController textEditingControllerCustomerEmail =
      TextEditingController();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeCustomerName = FocusNode();
  FocusNode focusNodeCustomerAddress = FocusNode();
  FocusNode focusNodeCustomerEmail = FocusNode();
  String? _errorTextCustomerName;
  String? _errorTextCustomerAddress;
  String? _errorTextCustomerEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24),
          Text(
            'Bitte Vollständig Name eingeben',
            style: subtitleStyle(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: _textFieldCustomerName(),
          ),
          const SizedBox(height: 12),
          Text(
            'Bitte Vollständig Addresse eingeben',
            style: subtitleStyle(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: _textFieldCustomerAddress(),
          ),
          const SizedBox(height: 12),
          Text(
            'Bitte Email Addresse eingeben',
            style: subtitleStyle(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: _textFieldCustomerEmail(),
          ),
          const Spacer(),
          Text(
            'Totale Bestellung: ${widget.totalSummary} €',
            style: titleStyle(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 23),
          InkWell(
            onTap: () async {
              String customerName = textEditingControllerCustomerName.text;
              String customerAddress =
                  textEditingControllerCustomerAddress.text;
              if (bottonEnabled) {
                if (customerName.isNotEmpty && customerAddress.isNotEmpty) {
                  Orders orders = Orders(
                      data: OrderData(
                        customerAddress: customerAddress,
                        customerName: customerName,
                        productsId: widget.productsIdInCart,
                      ),
                      metadata: Metadata(createdTime: '2022.11.17'));
                  AsyncValue<void> submitOrderResponse =
                      ref.watch(submitOrderFutureProvider(orders));
                  submitOrderResponse.map(data: (data) {
                    return Flushbar(
                      margin: const EdgeInsets.all(16),
                      messageSize: 18,
                      flushbarPosition: FlushbarPosition.TOP,
                      message: "Bestellung abgegeben",
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
                      message: "Fehler beim Bestellen!",
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
                      message:
                          "${orders.data!.productsId!.length} Produkte sind Bestellt!",
                      icon: Lottie.network(
                          'https://assets1.lottiefiles.com/private_files/lf30_yo2zavgg.json'),
                      duration: const Duration(seconds: 4),
                      leftBarIndicatorColor: Colors.lime.shade500,
                    )..show(context);
                  });
                }
                await Future.delayed(const Duration(seconds: 3));
                AutoRouter.of(context).popAndPush(const HomeRoute());
              } else {
                Flushbar(
                  margin: const EdgeInsets.all(16),
                  messageSize: 18,
                  flushbarPosition: FlushbarPosition.TOP,
                  message: "Bitte alle Infos eingeben",
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
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.lime.shade500,
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
                child: Text(
                  'Bestellung abschließen',
                  style: subtitleStyle(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textFieldCustomerName() {
    return ResturantTextField(
      controller: textEditingControllerCustomerName,
      focusNode: focusNodeCustomerName,
      hintText: 'Name',
      errorText: _errorTextCustomerName,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget _textFieldCustomerAddress() {
    return ResturantTextField(
      controller: textEditingControllerCustomerAddress,
      focusNode: focusNodeCustomerAddress,
      hintText: 'Adresse',
      errorText: _errorTextCustomerAddress,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      onChanged: (newValue) {
        String customerName = textEditingControllerCustomerName.text;
        if (customerName.isNotEmpty && newValue.isNotEmpty) {
          setState(() {
            bottonEnabled = true;
          });
        }
      },
    );
  }

  Widget _textFieldCustomerEmail() {
    return ResturantTextField(
      controller: textEditingControllerCustomerEmail,
      focusNode: focusNodeCustomerEmail,
      hintText: 'Optional',
      errorText: _errorTextCustomerEmail,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
