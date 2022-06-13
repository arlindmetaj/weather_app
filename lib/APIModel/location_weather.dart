import 'package:json_annotation/json_annotation.dart';

part 'location_weather.g.dart';

@JsonSerializable()
class LocationWeather {
  @JsonKey(name: "name")
  late final String name;

  @JsonKey(name: "country")
  late final String country;

  @JsonKey(name: "region")
  late final String region;

  @JsonKey(name: "lat")
  late final String lat;

  @JsonKey(name: "lon")
  late final String lon;

  @JsonKey(name: "timezone_id")
  late final String timezoneId;

  @JsonKey(name: "localtime")
  late final String localTime;

  @JsonKey(name: "localtime_epoch")
  late final int localtimeEpoch;

  @JsonKey(name: "utc_offset")
  late final String utcOffset;

  LocationWeather({
    required this.name,
    required this.country,
    required this.region,
    required this.lat,
    required this.lon,
    required this.timezoneId,
    required this.localTime,
    required this.localtimeEpoch,
    required this.utcOffset,
  });

  factory LocationWeather.fromJson(Map<String, dynamic> data) =>
      _$LocationWeatherFromJson(data);

  Map<String, dynamic> toJson() => _$LocationWeatherToJson(this);
}
