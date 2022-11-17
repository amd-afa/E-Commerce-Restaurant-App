import 'package:e_commerce_restaurant/models/metadata.dart';
import 'package:e_commerce_restaurant/models/orders/order_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders.g.dart';

@JsonSerializable(explicitToJson: true)
class Orders {
  late Metadata? metadata;

  late OrderData? data;

  Orders({
    this.metadata,
    this.data,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);

  factory Orders.fromDocument(dynamic document) {
    Orders orders = Orders.fromJson(document.data()!);
    return orders;
  }
}
