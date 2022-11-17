// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderData _$OrderDataFromJson(Map<String, dynamic> json) => OrderData(
      customerName: json['customerName'] as String?,
      customerAddress: json['customerAddress'] as String?,
      productsId: (json['productsId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'customerName': instance.customerName,
      'customerAddress': instance.customerAddress,
      'productsId': instance.productsId,
    };
