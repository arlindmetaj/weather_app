import 'package:json_annotation/json_annotation.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class Current {
  @JsonKey(name: 'observation_time')
  late final String observationTime;

  @JsonKey(name: 'temperature')
  late final int temperature;

  @JsonKey(name: 'weather_code')
  late final int weatherCode;

  @JsonKey(name: 'weather_icons')
  late final List<String> weatherIcons;

  @JsonKey(name: 'weather_descriptions')
  late final List<String> weatherDescription;

  @JsonKey(name: 'wind_speed')
  late final int windSpeed;

  @JsonKey(name: 'wind_degree')
  late final int windDegree;

  @JsonKey(name: 'wind_dir')
  late final String windDir;

  @JsonKey(name: 'pressure')
  late final int pressure;

  @JsonKey(name: 'precip')
  late final double precip;

  @JsonKey(name: 'humidity')
  late final int humidity;

  @JsonKey(name: 'cloudcover')
  late final int cloudCover;

  @JsonKey(name: 'feelslike')
  late final int feelsLike;

  @JsonKey(name: 'uv_index')
  late final int uvIndex;

  @JsonKey(name: 'visibility')
  late final int visibility;

  @JsonKey(name: 'is_day')
  late final String isDay;

  Current({
    required this.observationTime,
    required this.temperature,
    required this.weatherCode,
    required this.weatherIcons,
    required this.weatherDescription,
    required this.windSpeed,
    required this.windDegree,
    required this.windDir,
    required this.pressure,
    required this.precip,
    required this.humidity,
    required this.cloudCover,
    required this.feelsLike,
    required this.uvIndex,
    required this.visibility,
    required this.isDay,
  });

  factory Current.fromJson(Map<String, dynamic> data) =>
      _$CurrentFromJson(data);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
