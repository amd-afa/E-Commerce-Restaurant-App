import 'package:e_commerce_restaurant/models/metadata.dart';
import 'package:e_commerce_restaurant/models/products/product_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Products {
  late Data? date;
  late Metadata? metadata;

  Products({
    this.date,
    this.metadata,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);

  factory Products.fromDocument(dynamic document) {
    Products products = Products.fromJson(document.data()!);
    return products;
  }
}
