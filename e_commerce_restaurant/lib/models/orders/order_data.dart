import 'package:json_annotation/json_annotation.dart';

part 'order_data.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderData {
  late String? customerName;
  late String? customerAddress;
  late List<String>? productsId;

  OrderData({
    this.customerName,
    this.customerAddress,
    this.productsId,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}
