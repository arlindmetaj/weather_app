import 'package:json_annotation/json_annotation.dart';

part 'request_weather.g.dart';

@JsonSerializable()
class Request {
  @JsonKey(name: 'type')
  late final String type;

  @JsonKey(name: 'query')
  late final String query;

  @JsonKey(name: 'language')
  late final String language;

  @JsonKey(name: 'unit')
  late final String unit;

  Request({
    required this.type,
    required this.query,
    required this.language,
    required this.unit,
  });

  factory Request.fromJson(Map<String,dynamic> data) => _$RequestFromJson(data);

  Map<String,dynamic> toJson() => _$RequestToJson(this);
}
