import 'package:json_annotation/json_annotation.dart';

import 'cities_model_data.dart';

part 'cities_model.g.dart';
@JsonSerializable()
class Cities {
  @JsonKey(name: 'error')
  late final bool error;

  @JsonKey(name: 'msg')
  late final String msg;

  @JsonKey(name: 'data')
  late final List<CitiesData> data;

  Cities({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory Cities.fromJson(Map<String, dynamic> data) =>
      _$CitiesFromJson(data);

  Map<String, dynamic> toJson() => _$CitiesToJson(this);
}


