import 'package:json_annotation/json_annotation.dart';
import 'package:public_api/APIModel/location_weather.dart';
import 'package:public_api/APIModel/request_weather.dart';

import 'current_weather.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'request')
  late final Request request;

  @JsonKey(name: 'location')
  late final LocationWeather location;

  @JsonKey(name: 'current')
  late final Current current;

  WeatherModel({
    required this.request,
    required this.location,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) =>
      _$WeatherModelFromJson(data);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
