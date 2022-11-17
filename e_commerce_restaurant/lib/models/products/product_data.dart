import 'package:json_annotation/json_annotation.dart';

part 'product_data.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductData {
  late double? price;
  late String? imageUrl;
  late String? description;
  late String? id;
  late String? title;

  ProductData({
    this.price,
    this.imageUrl,
    this.description,
    this.id,
    this.title,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
