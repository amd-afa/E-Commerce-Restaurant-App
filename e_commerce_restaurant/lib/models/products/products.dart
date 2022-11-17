import 'package:e_commerce_restaurant/models/metadata.dart';
import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable(explicitToJson: true)
class Products {
  late Metadata? metadata;

  late ProductData? data;

  Products({
    this.metadata,
    this.data,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  factory Products.fromDocument(dynamic document) {
    Products products = Products.fromJson(document.data()!);
    return products;
  }
}
