import 'package:json_annotation/json_annotation.dart';

part 'product_data.g.dart';

@JsonSerializable()
class Data {
  late String? description;
  late String? id;
  late String? imageUrl;
  late double? price;
  late String? title;

  Data({
    this.description,
    this.id,
    this.imageUrl,
    this.price,
    this.title,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
