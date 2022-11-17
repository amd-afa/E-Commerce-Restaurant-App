import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable(explicitToJson: true)
class Metadata {
  late String? createdTime;

  Metadata({this.createdTime});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
